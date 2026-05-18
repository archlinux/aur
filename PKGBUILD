# Maintainer: ridellazor <danishfauza9@gmail.com>

pkgname=plexde
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal Wayland desktop environment — labwc compositor with custom Qt6 shell"
arch=('x86_64')
url="https://github.com/RidelLazor/PlexDE"
license=('MIT')
depends=(
    'labwc'
    'qt6-base'
    'qt6-wayland'
    'layer-shell-qt'
    'python'
)
makedepends=(
    'cmake'
    'qt6-tools'
)
optdepends=(
    'python-pillow: regenerate assets'
    'foot: default terminal emulator'
    'dolphin: default file manager'
    'networkmanager: WiFi status/toggle in panel'
    'bluez: Bluetooth status/toggle in panel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/RidelLazor/PlexDE/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export QT_QPA_PLATFORM=offscreen
    cmake -B build -S src/shell \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j"$(nproc)"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    test -x build/pde-shell
    test -f src/pde-ws
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Shell binary
    install -Dm755 build/pde-shell "$pkgdir/usr/bin/pde-shell"

    # Workspace manager
    install -Dm755 src/pde-ws "$pkgdir/usr/bin/pde-ws"

    # Generate fresh assets at build time
    python3 generate_assets.py
    install -Dm644 assets/background.png "$pkgdir/usr/share/plexde/assets/background.png"

    # Install PlexDE theme for labwc
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/themes/PlexDE/openbox-3/themerc" <<'EOF'
# PlexDE theme for labwc
window.color: 1a1b1e
titlebar.height: 32
titlebar.bg.color: 252528
titlebar.active.bg.color: 7c3aed
titlebar.label.text.color: 999999
titlebar.active.label.text.color: ffffff
titlebar.button.width: 24
titlebar.button.height: 24
titlebar.button.color: 3a3b3e
titlebar.button.active.color: 7c3aed
titlebar.button.close.color: 555555
titlebar.button.close.active.color: 7c3aed
border.width: 2
border.color: 3a3b3e
border.active.color: 7c3aed
menu.items.bg: 1a1b1e
menu.items.text.color: e2e8f0
menu.items.active.bg.color: 252528
menu.items.active.text.color: 7c3aed
osd.bg.color: 1a1b1e
osd.border.color: 7c3aed
windowswitcher.bg.color: 1a1b1e
windowswitcher.border.color: 7c3aed
windowswitcher.label.text.color: e2e8f0
windowswitcher.item.bg.color: 252528
windowswitcher.item.active.bg.color: 7c3aed
EOF

    # Example config files for /usr/share/plexde/
    install -Dm644 /dev/stdin "$pkgdir/usr/share/plexde/config/rc.xml" <<'EOF'
<?xml version="1.0"?>
<labwc_config>
  <core>
    <decoration>server</decoration>
    <focusFollowMouse>yes</focusFollowMouse>
  </core>
  <theme>
    <name>PlexDE</name>
    <cornerRadius>8</cornerRadius>
    <keepBorder>yes</keepBorder>
  </theme>
  <desktops>
    <number>4</number>
    <names><name>1</name><name>2</name><name>3</name><name>4</name></names>
  </desktops>
  <keyboard>
    <default key="Super_L">
      <action name="Execute" command="busctl call --user org.plexde.Shell /org/plexde/Shell org.plexde.Shell toggleLauncher"/>
    </default>
    <default key="Super_R">
      <action name="Execute" command="busctl call --user org.plexde.Shell /org/plexde/Shell org.plexde.Shell toggleLauncher"/>
    </default>
    <keybind key="W-Return"><action name="Execute" command="foot"/></keybind>
    <keybind key="W-q"><action name="Close"/></keybind>
    <keybind key="W-f"><action name="ToggleFullscreen"/></keybind>
    <keybind key="W-m"><action name="ToggleMaximize"/></keybind>
    <keybind key="W-n"><action name="Iconify"/></keybind>
    <keybind key="A-Tab"><action name="NextWindow"/></keybind>
    <keybind key="A-S-Tab"><action name="PreviousWindow"/></keybind>
    <keybind key="W-1"><action name="GoToDesktop" to="1"/></keybind>
    <keybind key="W-2"><action name="GoToDesktop" to="2"/></keybind>
    <keybind key="W-3"><action name="GoToDesktop" to="3"/></keybind>
    <keybind key="W-4"><action name="GoToDesktop" to="4"/></keybind>
    <keybind key="W-e"><action name="Execute" command="dolphin"/></keybind>
    <keybind key="W-A-q"><action name="Exit"/></keybind>
  </keyboard>
  <mouse>
    <context name="Root">
      <mousebind button="Right" action="Press">
        <action name="ShowMenu" menu="root-menu"/>
      </mousebind>
    </context>
    <context name="TitleBar">
      <mousebind button="Left" action="Press">
        <action name="Focus"/><action name="Raise"/>
      </mousebind>
      <mousebind button="Left" action="Drag"><action name="Move"/></mousebind>
      <mousebind button="Left" action="DoubleClick"><action name="ToggleMaximize"/></mousebind>
    </context>
  </mouse>
</labwc_config>
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/plexde/config/environment" <<'EOF'
QT_QPA_PLATFORM=wayland;xcb
QT_WAYLAND_DISABLE_WINDOWDECORATION=1
GDK_BACKEND=wayland,x11
XDG_CURRENT_DESKTOP=PlexDE
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/share/plexde/config/autostart" <<'PEOF'
#!/usr/bin/env bash
# PlexDE autostart for labwc
pde-shell &
pde-ws status &
PEOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/plexde/config/menu.xml" <<'EOF'
<?xml version="1.0"?>
<labwc_menu>
  <menu id="root-menu" label="PlexDE">
    <item label="Terminal (foot)" action="Execute" command="foot"/>
    <item label="File Manager (dolphin)" action="Execute" command="dolphin"/>
    <separator/>
    <item label="Reconfigure" action="Execute" command="busctl call --user org.labwc.WindowManager /org/labwc/WindowManager org.labwc.WindowManager reconfigure"/>
    <item label="Exit" action="Exit"/>
  </menu>
</labwc_menu>
EOF

    # Session launcher — bootstraps labwc config then exec
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/plexde-session" <<'PEOF'
#!/usr/bin/env bash
# PlexDE session — bootstrap labwc config and start the compositor
set -e

export XDG_CURRENT_DESKTOP=PlexDE
export XDG_SESSION_DESKTOP=PlexDE
export QT_QPA_PLATFORM=wayland;xcb
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export GDK_BACKEND=wayland,x11

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/labwc"
SKEL_DIR="/usr/share/plexde/config"

# Seed ~/.config/labwc/ with defaults if empty
if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
    for f in rc.xml environment autostart menu.xml; do
        if [ -f "$SKEL_DIR/$f" ]; then
            cp "$SKEL_DIR/$f" "$CONFIG_DIR/$f"
        fi
    done
    chmod +x "$CONFIG_DIR/autostart" 2>/dev/null || true
fi

# Ensure themerc exists (it's not in skel since it ships in the theme dir)
if [ ! -f "$CONFIG_DIR/themerc" ]; then
    # labwc falls back to the theme dir themerc, so this is optional
    true
fi

exec labwc "$@"
PEOF
    chmod 755 "$pkgdir/usr/bin/plexde-session"

    # Desktop entry for display managers
    install -Dm644 /dev/stdin "$pkgdir/usr/share/wayland-sessions/plexde.desktop" <<'EOF'
[Desktop Entry]
Name=PlexDE
Comment=Minimal Wayland desktop environment
Exec=/usr/bin/plexde-session
Type=Application
EOF
}
