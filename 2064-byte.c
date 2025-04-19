#include <stdio.h>
#include <unistd.h>

typedef struct {
    int head[3];
    int data[2048/4];
    int tail;
} DVD_SEC;

void usage(const char *prog) {
    fprintf(stderr, "Usage: %s < faulty iso > resultant iso\n", prog);
}

int main(int argc, char* argv[]) {
    // Si se ejecuta sin redirección de entrada/salida, mostrar uso
    if (isatty(STDIN_FILENO) && isatty(STDOUT_FILENO)) {
        usage(argv[0]);
        return 1;
    }

    DVD_SEC dvd;
    ssize_t n;

    // Leer bloques de 2064 bytes y escribir los 2048 de datos
    while ((n = read(STDIN_FILENO, &dvd, sizeof(DVD_SEC))) > 0) {
        if (write(STDOUT_FILENO, dvd.data, 2048) != 2048) {
            perror("write");
            return 1;
        }
    }

    if (n < 0) {
        perror("read");
        return 1;
    }

    return 0;
}

