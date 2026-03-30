#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <security/pam_appl.h>
#include <security/pam_modules.h>
#include <security/pam_ext.h>
#include <unistd.h>
#include <sys/ioctl.h>

#define PASSWD_FILE "/etc/2fact/passwd"

struct MemoryStruct {
    char *memory;
    size_t size;
};

static size_t WriteMemoryCallback(void *contents, size_t size, size_t nmemb, void *userp) {
    size_t realsize = size * nmemb;
    struct MemoryStruct *mem = (struct MemoryStruct *)userp;

    char *ptr = realloc(mem->memory, mem->size + realsize + 1);
    if (!ptr) return 0;

    mem->memory = ptr;
    memcpy(&(mem->memory[mem->size]), contents, realsize);
    mem->size += realsize;
    mem->memory[mem->size] = 0;

    return realsize;
}

/* Проверяем, запущена ли графическая сессия */
static int is_gui_session(void) {
    const char *display = getenv("DISPLAY");
    const char *wayland = getenv("WAYLAND_DISPLAY");
    const char *xdg_session_type = getenv("XDG_SESSION_TYPE");
    
    if (display && *display) return 1;
    if (wayland && *wayland) return 1;
    if (xdg_session_type && strcmp(xdg_session_type, "x11") == 0) return 1;
    if (xdg_session_type && strcmp(xdg_session_type, "wayland") == 0) return 1;
    
    return 0;
}

/* Простой генератор QR-кода в консоли */
static void print_qr_code(const char *url) {
    printf("\n========================================\n");
    printf("SCAN THIS QR CODE WITH YOUR PHONE:\n");
    printf("========================================\n\n");
    
    // Упрощенное представление QR-кода (ссылка)
    printf("📱 URL: %s\n\n", url);
    
    // Создаем простой ASCII QR (имитация)
    int len = strlen(url);
    int width = (len > 40) ? 40 : len + 4;
    
    printf("┌");
    for (int i = 0; i < width; i++) printf("─");
    printf("┐\n");
    
    printf("│");
    for (int i = 0; i < width; i++) printf(" ");
    printf("│\n");
    
    printf("│  ");
    if (len > width - 4) {
        char truncated[width - 1];
        strncpy(truncated, url, width - 5);
        truncated[width - 5] = '\0';
        printf("%s...", truncated);
    } else {
        printf("%s", url);
        for (int i = len; i < width - 4; i++) printf(" ");
    }
    printf("  │\n");
    
    printf("│");
    for (int i = 0; i < width; i++) printf(" ");
    printf("│\n");
    
    printf("└");
    for (int i = 0; i < width; i++) printf("─");
    printf("┘\n\n");
    
    printf("Or open in browser: %s\n", url);
    printf("========================================\n\n");
}

/* Регистрация нового пользователя через API */
static int register_user(const char *username, const char *password) {
    CURL *curl;
    CURLcode res;
    char *json_data = NULL;
    struct MemoryStruct chunk;
    long http_code = 0;
    int result = 0;

    chunk.memory = malloc(1);
    chunk.size = 0;

    asprintf(&json_data, "{\"username\":\"%s\",\"password\":\"%s\"}",
             username, password);

    curl_global_init(CURL_GLOBAL_ALL);
    curl = curl_easy_init();

    if (curl) {
        struct curl_slist *headers = NULL;
        headers = curl_slist_append(headers, "Content-Type: application/json");

        curl_easy_setopt(curl, CURLOPT_URL, "http://localhost:13031/api/v1/register");
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, json_data);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteMemoryCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&chunk);
        curl_easy_setopt(curl, CURLOPT_TIMEOUT, 5L);

        res = curl_easy_perform(curl);
        curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &http_code);

        if (res == CURLE_OK && http_code == 200) {
            // Ищем QR-код в ответе
            char *qr_start = strstr(chunk.memory, "\"qrcode\":\"");
            if (qr_start) {
                qr_start += 10;
                char *qr_end = strchr(qr_start, '"');
                if (qr_end) {
                    int qr_len = qr_end - qr_start;
                    char qr_url[512];
                    strncpy(qr_url, qr_start, qr_len);
                    qr_url[qr_len] = '\0';
                    
                    printf("\n✅ Registration successful!\n");
                    print_qr_code(qr_url);
                    result = 1;
                }
            }
        } else {
            printf("❌ Registration failed (HTTP %ld)\n", http_code);
            if (chunk.memory && chunk.memory[0]) {
                printf("Response: %s\n", chunk.memory);
            }
        }

        curl_slist_free_all(headers);
        curl_easy_cleanup(curl);
    }

    curl_global_cleanup();
    free(json_data);
    free(chunk.memory);

    return result;
}

static int call_auth_api(const char *username, const char *password, const char *token) {
    CURL *curl;
    CURLcode res;
    char *json_data = NULL;
    struct MemoryStruct chunk;
    long http_code = 0;
    int result = 0;

    chunk.memory = malloc(1);
    chunk.size = 0;

    asprintf(&json_data, "{\"username\":\"%s\",\"password\":\"%s\",\"token\":\"%s\"}",
             username, password, token);

    curl_global_init(CURL_GLOBAL_ALL);
    curl = curl_easy_init();

    if (curl) {
        struct curl_slist *headers = NULL;
        headers = curl_slist_append(headers, "Content-Type: application/json");

        curl_easy_setopt(curl, CURLOPT_URL, "http://localhost:13031/api/v1/auth");
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, json_data);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteMemoryCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&chunk);
        curl_easy_setopt(curl, CURLOPT_TIMEOUT, 5L);

        res = curl_easy_perform(curl);
        curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &http_code);

        if (res == CURLE_OK && http_code == 200) {
            if (strstr(chunk.memory, "\"status\":\"ok\"")) {
                result = 1;
            }
        }

        curl_slist_free_all(headers);
        curl_easy_cleanup(curl);
    }

    curl_global_cleanup();
    free(json_data);
    free(chunk.memory);

    return result;
}

static int find_user_token(const char *username, char *token, size_t token_size) {
    FILE *f = fopen(PASSWD_FILE, "r");
    if (!f) {
        return 0;
    }

    char line[512];
    int found = 0;

    while (fgets(line, sizeof(line), f)) {
        char *newline = strchr(line, '\n');
        if (newline) *newline = '\0';

        char *colon = strchr(line, ':');
        if (!colon) continue;

        *colon = '\0';
        char *file_username = line;
        char *file_token = colon + 1;

        if (strcmp(file_username, username) == 0) {
            strncpy(token, file_token, token_size - 1);
            token[token_size - 1] = '\0';
            found = 1;
            break;
        }
    }

    fclose(f);
    return found;
}

PAM_EXTERN int pam_sm_setcred(pam_handle_t *pamh, int flags, int argc, const char **argv) {
    return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_acct_mgmt(pam_handle_t *pamh, int flags, int argc, const char **argv) {
    return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_open_session(pam_handle_t *pamh, int flags, int argc, const char **argv) {
    return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_close_session(pam_handle_t *pamh, int flags, int argc, const char **argv) {
    return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_chauthtok(pam_handle_t *pamh, int flags, int argc, const char **argv) {
    return PAM_SERVICE_ERR;
}

static int _converse(pam_handle_t *pamh, int nargs, const struct pam_message **message, struct pam_response **response) {
    struct pam_conv *conv;
    int retval;

    retval = pam_get_item(pamh, PAM_CONV, (void *)&conv);
    if (retval != PAM_SUCCESS) return retval;

    return conv->conv(nargs, message, response, conv->appdata_ptr);
}

static char *converse(pam_handle_t *pamh, int echocode, const char *prompt) {
    const struct pam_message msg = {.msg_style = echocode, .msg = (char *)prompt};
    const struct pam_message *msgs = &msg;
    struct pam_response *resp = NULL;
    int retval = _converse(pamh, 1, &msgs, &resp);
    char *ret = NULL;

    if (retval == PAM_SUCCESS && resp && resp->resp && *resp->resp) {
        ret = strdup(resp->resp);
    }

    if (resp) {
        if (!ret) free(resp->resp);
        free(resp);
    }

    return ret;
}

PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh, int flags, int argc, const char **argv) {
    char *username = NULL;
    char *password = NULL;
    char token[256] = {0};
    int auth_ok = 0;
    int is_new_user = 0;

    /* Получаем username из аргументов модуля */
    for (int i = 0; i < argc; i++) {
        if (strncmp(argv[i], "username=", 9) == 0) {
            username = strdup(argv[i] + 9);
        }
    }

    if (!username) {
        if (username) free(username);
        return PAM_AUTH_ERR;
    }

    /* Проверяем, существует ли пользователь */
    if (!find_user_token(username, token, sizeof(token))) {
        /* Новый пользователь - предлагаем зарегистрироваться */
        pam_info(pamh, "New user detected. Please register.");
        
        /* Запрашиваем пароль для регистрации */
        char *reg_password = converse(pamh, PAM_PROMPT_ECHO_OFF, "Enter password for registration: ");
        if (!reg_password) {
            free(username);
            return PAM_AUTH_ERR;
        }
        
        /* Регистрируем пользователя */
        if (register_user(username, reg_password)) {
            free(reg_password);
            is_new_user = 1;
            
            /* После регистрации запрашиваем QR-код для подтверждения */
            if (is_gui_session()) {
                pam_info(pamh, "✅ Registration successful! Please scan QR code in browser.");
                pam_info(pamh, "Opening verification page...");
                /* В GUI можно открыть браузер */
                char cmd[512];
                snprintf(cmd, sizeof(cmd), "xdg-open http://localhost:13031/api/v1/verify?user=%s 2>/dev/null &", username);
                system(cmd);
            } else {
                pam_info(pamh, "✅ Registration successful!");
                pam_info(pamh, "Please open in browser: http://localhost:13031/api/v1/verify?user=%s", username);
            }
            
            pam_info(pamh, "Press Enter after completing verification...");
            converse(pamh, PAM_PROMPT_ECHO_ON, "Press Enter: ");
            
            /* После подтверждения проверяем аутентификацию */
            if (find_user_token(username, token, sizeof(token))) {
                password = converse(pamh, PAM_PROMPT_ECHO_OFF, "PIN: ");
                if (password) {
                    auth_ok = call_auth_api(username, password, token);
                    free(password);
                }
            }
        } else {
            free(reg_password);
            pam_info(pamh, "Registration failed");
        }
    } else {
        /* Существующий пользователь - обычная аутентификация */
        password = converse(pamh, PAM_PROMPT_ECHO_OFF, "PIN: ");
        if (!password) {
            free(username);
            return PAM_AUTH_ERR;
        }

        auth_ok = call_auth_api(username, password, token);
        free(password);
    }

    free(username);

    if (auth_ok) {
        return PAM_SUCCESS;
    }

    return PAM_AUTH_ERR;
}
