# Maintainer: shrimp
# Akiflow Desktop for Linux (unofficial)

pkgname=akiflow-bin
pkgver=2.72.5
pkgrel=1
_buildhash=7536ef84
pkgdesc="Akiflow - Time blocking and task management (unofficial Linux build)"
arch=('x86_64')
url="https://akiflow.com"
license=('custom')
depends=('electron')
makedepends=('p7zip' 'imagemagick' 'icoutils' 'python')
source=("Akiflow-${pkgver}.exe::https://download.akiflow.com/builds/Akiflow-${pkgver}-${_buildhash}-x64.exe")
sha512sums=('e4aeadcf7ec8a2a9c46dda84fe59d1cf38898808f891d28f98c73c8e1514d61051f4fa19215774c56c5c297befddefce4f8e55a6ec9bc92ed5d6a8b59c5a155d')

prepare() {
    cd "${srcdir}"

    # Extract the NSIS installer
    7z x -y "Akiflow-${pkgver}.exe" -oextracted

    # Extract icons from exe if present
    if [ -f "extracted/\$PLUGINSDIR/app-64.7z" ]; then
        7z x -y "extracted/\$PLUGINSDIR/app-64.7z" -oapp
    else
        # Fallback: the app might be directly in extracted
        cp -r extracted app 2>/dev/null || true
    fi

    # Try to extract icon
    if [ -f "app/Akiflow.exe" ]; then
        wrestool -x -t 14 app/Akiflow.exe -o akiflow.ico 2>/dev/null || true
    elif [ -f "extracted/Akiflow.exe" ]; then
        wrestool -x -t 14 extracted/Akiflow.exe -o akiflow.ico 2>/dev/null || true
    fi

    # Convert ico to png if we got one
    if [ -f "akiflow.ico" ]; then
        icotool -x akiflow.ico 2>/dev/null || true
        mkdir -p icons/hicolor
        for size in 16 24 32 48 64 128 256; do
            icon_file=$(ls akiflow_*"${size}x${size}"*.png 2>/dev/null | head -1)
            if [ -n "$icon_file" ]; then
                mkdir -p "icons/hicolor/${size}x${size}/apps"
                cp "$icon_file" "icons/hicolor/${size}x${size}/apps/akiflow.png"
            fi
        done
    fi
}

_find_asar() {
    if [ -f "${srcdir}/app/resources/app.asar" ]; then
        echo "${srcdir}/app/resources"
    elif [ -f "${srcdir}/extracted/resources/app.asar" ]; then
        echo "${srcdir}/extracted/resources"
    else
        dirname "$(find "${srcdir}" -name 'app.asar' -type f | head -1)"
    fi
}

build() {
    # Patch app.asar to write tray status for the KDE Plasma widget
    ASAR_PATH="$(_find_asar)"
    if [ -z "$ASAR_PATH" ] || [ ! -f "$ASAR_PATH/app.asar" ]; then
        echo "ERROR: Could not find app.asar"
        exit 1
    fi

    cd "$ASAR_PATH"
    python "${startdir}/patch-main.py"
}

package() {
    ASAR_PATH="$(_find_asar)"
    if [ -z "$ASAR_PATH" ] || [ ! -f "$ASAR_PATH/app.asar" ]; then
        echo "ERROR: Could not find app.asar"
        exit 1
    fi

    # Install app files
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp "$ASAR_PATH/app.asar" "${pkgdir}/usr/lib/${pkgname}/"

    # Copy unpacked resources if they exist
    if [ -d "$ASAR_PATH/app.asar.unpacked" ]; then
        cp -r "$ASAR_PATH/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}/"
    fi

    # Install icons if we extracted them
    if [ -d "${srcdir}/icons/hicolor" ]; then
        install -d "${pkgdir}/usr/share/icons"
        cp -r "${srcdir}/icons/"* "${pkgdir}/usr/share/icons/"
    fi

    # Create desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Akiflow
GenericName=Task Management
Comment=Time blocking and task management
Exec=${pkgname} %u
Icon=akiflow
Type=Application
Terminal=false
Categories=Office;ProjectManagement;Calendar;
MimeType=x-scheme-handler/akiflow;
StartupWMClass=Akiflow
EOF

    # Create launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
exec electron --class=Akiflow --name=Akiflow /usr/lib/${pkgname}/app.asar "\$@"
EOF

    # Install KDE Plasma widget for upcoming events
    if [ -d "${startdir}/plasma-widget/package" ]; then
        install -d "${pkgdir}/usr/share/plasma/plasmoids/com.akiflow.panelwidget"
        cp -r "${startdir}/plasma-widget/package/"* "${pkgdir}/usr/share/plasma/plasmoids/com.akiflow.panelwidget/"
    fi
}
