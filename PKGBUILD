# Maintainer: nardholio <nardholio@gmail.com>

pkgname=x11-multimonitor-center
pkgver=2
pkgrel=2
pkgdesc="X11 tray app to move newly spawned windows to the monitor with the mouse cursor if they spawn somewhere else"
arch=('any')
url="none"
license=('GPL3')
depends=('gtk3' 'libwnck3')
makedepends=('pkgconf')

prepare() {
  # Main source code
  cat > x11-multimonitor-center.c << 'EOF'
/* x11-multimonitor-center */

#define WNCK_I_KNOW_THIS_IS_UNSTABLE

#include <gtk/gtk.h>
#include <libwnck/libwnck.h>
#include <gdk/gdk.h>
#include <gdk/gdkx.h>
#include <libappindicator/app-indicator.h>
#include <stdio.h>
#include <stdlib.h>

#define ICON_ENABLED "/usr/share/x11-multimonitor-center/icons/enabled.svg"
#define ICON_DISABLED "/usr/share/x11-multimonitor-center/icons/disabled.svg"
#define MOVE_DELAY_MS 10

static gboolean enabled = TRUE;
static GtkStatusIcon *status_icon = NULL;
static GtkWidget *menu = NULL;
static WnckScreen *screen = NULL;
static GtkWidget *toggle_item = NULL;
static WnckHandle *wnck_handle = NULL;
static GApplication *global_app = NULL;

static void update_tray_icon(void)
{
    if (!status_icon) return;
    gtk_status_icon_set_from_file(status_icon, enabled ? ICON_ENABLED : ICON_DISABLED);
}

static gboolean delayed_move_cb(gpointer user_data)
{
    WnckWindow *window = WNCK_WINDOW(user_data);

    if (!enabled) goto cleanup;

    /* WnckWindowType type = wnck_window_get_window_type(window);
    if (type == WNCK_WINDOW_DOCK || type == WNCK_WINDOW_DESKTOP ||
        type == WNCK_WINDOW_MENU || type == WNCK_WINDOW_UTILITY ||
        type == WNCK_WINDOW_SPLASHSCREEN || type == WNCK_WINDOW_TOOLBAR) {
        goto cleanup;
    } */

    GdkDisplay *display = gdk_display_get_default();
    GdkSeat *seat = gdk_display_get_default_seat(display);
    GdkDevice *pointer = gdk_seat_get_pointer(seat);
    if (!pointer) goto cleanup;

    int mouse_x, mouse_y;
    gdk_device_get_position(pointer, NULL, &mouse_x, &mouse_y);

    GdkMonitor *mouse_monitor = gdk_display_get_monitor_at_point(display, mouse_x, mouse_y);
    if (!mouse_monitor) goto cleanup;

    int win_x, win_y, win_w, win_h;
    wnck_window_get_geometry(window, &win_x, &win_y, &win_w, &win_h);
    if (win_w <= 0 || win_h <= 0) goto cleanup;

    int win_center_x = win_x + win_w / 2;
    int win_center_y = win_y + win_h / 2;

    GdkMonitor *win_monitor = gdk_display_get_monitor_at_point(display, win_center_x, win_center_y);
    if (win_monitor == mouse_monitor) goto cleanup;

    GdkRectangle geom;

    if (wnck_window_is_fullscreen(window)) {
        /* Fullscreen windows: move only (do not resize) so the window manager
         * can automatically resize them to the new monitor's full geometry. */
        gdk_monitor_get_geometry(mouse_monitor, &geom);
        int new_x = geom.x;
        int new_y = geom.y;
        wnck_window_set_geometry(window,
                                 WNCK_WINDOW_GRAVITY_CURRENT,
                                 WNCK_WINDOW_CHANGE_X | WNCK_WINDOW_CHANGE_Y,
                                 new_x, new_y, 0, 0);
        printf("MOVED fullscreen window → to mouse monitor @ (%d,%d)\n", new_x, new_y);
    } else {
        /* Normal windows: use workarea (respects systray/panels/taskbars) and clamp/center */
        gdk_monitor_get_workarea(mouse_monitor, &geom);
        int target_w = (win_w > geom.width) ? geom.width : win_w;
        int target_h = (win_h > geom.height) ? geom.height : win_h;
        int new_x = geom.x + (geom.width - target_w) / 2;
        int new_y = geom.y + (geom.height - target_h) / 2;
        wnck_window_set_geometry(window,
                                 WNCK_WINDOW_GRAVITY_CURRENT,
                                 WNCK_WINDOW_CHANGE_X | WNCK_WINDOW_CHANGE_Y |
                                 WNCK_WINDOW_CHANGE_WIDTH | WNCK_WINDOW_CHANGE_HEIGHT,
                                 new_x, new_y, target_w, target_h);
        printf("MOVED window → centered on mouse monitor @ (%d,%d) size %dx%d\n", new_x, new_y, target_w, target_h);
    }

cleanup:
    g_object_unref(window);
    return FALSE;
}

static void
window_opened_cb(WnckScreen *scr, WnckWindow *window, gpointer user_data)
{
    (void)scr; (void)user_data;
    if (!enabled) return;
    g_timeout_add(MOVE_DELAY_MS, delayed_move_cb, g_object_ref(window));
}

static void
toggle_enabled_cb(GtkCheckMenuItem *item, gpointer data)
{
    enabled = gtk_check_menu_item_get_active(item);
    update_tray_icon();
}

static void
icon_activate_cb(GtkStatusIcon *icon, gpointer user_data)
{
    (void)icon; (void)user_data;
    enabled = !enabled;
    if (toggle_item) {
        gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(toggle_item), enabled);
    }
    update_tray_icon();
}

static void
show_popup_menu_cb(GtkStatusIcon *icon, guint button, guint activate_time, gpointer user_data)
{
    (void)icon; (void)user_data;
    gtk_menu_popup(GTK_MENU(menu), NULL, NULL,
                   gtk_status_icon_position_menu,
                   status_icon, button, activate_time);
}

static void
quit_cb(GtkMenuItem *item, gpointer data)
{
    (void)item; (void)data;
    if (global_app)
        g_application_quit(global_app);
}

static void
create_tray_icon(void)
{
    status_icon = gtk_status_icon_new_from_file(ICON_ENABLED);
    gtk_status_icon_set_tooltip_text(status_icon, "x11-multimonitor-center");

    menu = gtk_menu_new();

    GtkWidget *toggle = gtk_check_menu_item_new_with_label("Enabled");
    gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(toggle), enabled);
    g_signal_connect(toggle, "toggled", G_CALLBACK(toggle_enabled_cb), NULL);
    toggle_item = toggle;
    gtk_menu_shell_append(GTK_MENU_SHELL(menu), toggle);

    GtkWidget *separator = gtk_separator_menu_item_new();
    gtk_menu_shell_append(GTK_MENU_SHELL(menu), separator);

    GtkWidget *quit = gtk_menu_item_new_with_label("Quit");
    g_signal_connect(quit, "activate", G_CALLBACK(quit_cb), NULL);
    gtk_menu_shell_append(GTK_MENU_SHELL(menu), quit);

    gtk_widget_show_all(menu);

    g_signal_connect(status_icon, "activate", G_CALLBACK(icon_activate_cb), NULL);
    g_signal_connect(status_icon, "popup-menu", G_CALLBACK(show_popup_menu_cb), NULL);
}

static void
app_activate_cb(GApplication *app, gpointer user_data)
{
    (void)user_data;
    if (!screen) {
        wnck_handle = wnck_handle_new(WNCK_CLIENT_TYPE_PAGER);
        screen = wnck_handle_get_default_screen(wnck_handle);
        g_signal_connect(screen, "window-opened", G_CALLBACK(window_opened_cb), NULL);
        create_tray_icon();
        g_print("=== x11-multimonitor-center running ===\n");
    }
    g_application_hold(app);
}

int main(int argc, char **argv)
{
    gtk_init(&argc, &argv);
#if GTK_CHECK_VERSION(3,10,0)
    if (!GDK_IS_X11_DISPLAY(gdk_display_get_default())) {
        g_print("Error: This tool requires an X11 display\n");
        return EXIT_FAILURE;
    }
#endif

    global_app = g_application_new("org.x11multimonitor.center", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(global_app, "activate", G_CALLBACK(app_activate_cb), NULL);
    int status = g_application_run(global_app, argc, argv);
    g_object_unref(global_app);
    return status;
}
EOF

  # .desktop FILE
  cat > x11-multimonitor-center.desktop << 'EOF'
[Desktop Entry]
Type=Application
Name=X11 Multimonitor Center
Comment=X11 tray app to move newly spawned windows to the monitor with the mouse cursor if they spawn somewhere else
Icon=x11-multimonitor-center
Exec=x11-multimonitor-center
Terminal=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Categories=Utility;
StartupNotify=false
EOF

  # Monitor icons from Papirus light and dark themes
  # https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
  # License: GPL 3.0

  cat > enabled.svg << 'SVG'
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
  <path fill="#5e9" d="M20 3H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h4v2h8v-2h4c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"/>
  <path fill="#2e2e2e" d="M4 17V5h16v12H4z"/>
</svg>
SVG

  cat > disabled.svg << 'SVG'
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
  <path fill="#8a8a8a" d="M20 3H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h4v2h8v-2h4c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"/>
  <path fill="#2e2e2e" d="M4 17V5h16v12H4z"/>
</svg>
SVG
}

build() {
  gcc -Wall -O2 \
    -o x11-multimonitor-center x11-multimonitor-center.c \
    $(pkg-config --cflags --libs gtk+-3.0 libwnck-3.0)
}

package() {
  install -Dm755 x11-multimonitor-center "${pkgdir}/usr/bin/x11-multimonitor-center"
  install -Dm644 x11-multimonitor-center.desktop "${pkgdir}/usr/share/applications/x11-multimonitor-center.desktop"
  install -Dm644 x11-multimonitor-center.desktop "${pkgdir}/etc/xdg/autostart/x11-multimonitor-center.desktop"

  install -Dm755 -d "${pkgdir}/usr/share/x11-multimonitor-center/icons"
  install -Dm644 enabled.svg "${pkgdir}/usr/share/x11-multimonitor-center/icons/enabled.svg"
  install -Dm644 disabled.svg "${pkgdir}/usr/share/x11-multimonitor-center/icons/disabled.svg"

  install -Dm644 enabled.svg "${pkgdir}/usr/share/pixmaps/x11-multimonitor-center.svg"
}
