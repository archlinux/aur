# Maintainer: flammable_bunny <theflammablebunny@gmail.com>
pkgname=mcsrlauncher
pkgver=0.8.0_beta     # Must use underscore instead of hyphen due to AUR naming rules
pkgrel=1
pkgdesc='Minecraft Launcher written in Kotlin. Made for MCSR Community and MCSR Ranked'
arch=('any')
url='https://github.com/MCSRLauncher/Launcher'
license=('GPL-3.0-or-later')
depends=('java-runtime>=17' 'hicolor-icon-theme')
source=("MCSRLauncher-${pkgver}.jar::https://github.com/MCSRLauncher/Launcher/releases/download/${pkgver//_/-}/MCSRLauncher.jar")
sha256sums=('dee765520b8605b3cf59cb5e971e33c01dbba3498f68a739d3f5f0d44ecf0a39')

package() {
    cd "$srcdir"

    # Install JAR
    install -Dm644 "MCSRLauncher-${pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/MCSRLauncher.jar"

    # Extract and install icon
    bsdtar -xf "MCSRLauncher-${pkgver}.jar" icons/launcher/icon.png
    install -Dm644 icons/launcher/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=MCSR Launcher
Comment=Minecraft Launcher written in Kotlin. Made for MCSR Community and MCSR Ranked
Exec=mcsrlauncher %U
Icon=mcsrlauncher
Terminal=false
Type=Application
Categories=Game;
Keywords=minecraft;speedrun;mcsr;launcher;
StartupWMClass=MCSR Launcher
EOF

    # Install launcher script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/bash

# Auto apply _JAVA_AWT_WM_NONREPARENTING for Wayland and tiling WM sessions
if [ -z "$_JAVA_AWT_WM_NONREPARENTING" ]; then
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        export _JAVA_AWT_WM_NONREPARENTING=1
    elif [ -n "$XDG_CURRENT_DESKTOP" ]; then
        case "$XDG_CURRENT_DESKTOP" in
            sway|Sway|hyprland|Hyprland|i3|bspwm|dwm|awesome|qtile|river|niri|wayfire|wlroots)
                export _JAVA_AWT_WM_NONREPARENTING=1
                ;;
        esac
    fi
fi

exec java -jar /usr/share/java/mcsrlauncher/MCSRLauncher.jar "$@"
EOF
}
