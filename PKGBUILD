# Maintainer: shrimp
# Linear Desktop for Linux (unofficial)

pkgname=linear-bin
pkgver=1.30.0
pkgrel=1
pkgdesc="Linear - Issue tracking & project management (unofficial Linux build)"
arch=('x86_64')
url="https://linear.app"
license=('LicenseRef-Proprietary')
depends=('electron')
makedepends=('p7zip' 'imagemagick' 'icoutils' 'python')
provides=('linear')
conflicts=('linear-desktop' 'linear-desktop-bin' 'linear-desktop-git')
_ghraw="https://raw.githubusercontent.com/shrimpwtf/linear-arch/main"
source=("Linear-Setup-${pkgver}.exe::https://releases.linear.app/Linear%20Setup%20${pkgver}.exe"
        "patch-main.py::${_ghraw}/patch-main.py")
sha512sums=('31d309720ce21c93dd8a5bce9735bdfc045781db27b1bbfb80ad0048e16bde22836353d6abf1797f6dbb0bf250f48afb354bab63bd804f25997022424985fb98'
            'SKIP')

prepare() {
    cd "${srcdir}"

    # Extract the NSIS installer
    7z x -y "Linear-Setup-${pkgver}.exe" -oextracted

    # Linear's NSIS bundles BOTH x64 and arm64 archives. We're an x86_64 package.
    if [ -f "extracted/\$PLUGINSDIR/app-64.7z" ]; then
        7z x -y "extracted/\$PLUGINSDIR/app-64.7z" -oapp
    else
        echo "ERROR: app-64.7z not found in NSIS installer"
        exit 1
    fi

    # Extract icon group from Linear.exe (single 256x256 entry as of v1.30.0)
    if [ -f "app/Linear.exe" ]; then
        wrestool -x -t 14 app/Linear.exe -o linear.ico 2>/dev/null || true
    fi

    if [ -f "linear.ico" ]; then
        # Decompose ico → individual PNG sizes shipped inside the ico
        icotool -x linear.ico 2>/dev/null || true

        # Linear ships only 256x256, so derive smaller sizes via imagemagick
        SRC_PNG=$(ls linear_*256x256*.png 2>/dev/null | head -1)
        mkdir -p icons/hicolor

        for size in 16 24 32 48 64 128 256; do
            mkdir -p "icons/hicolor/${size}x${size}/apps"
            existing=$(ls linear_*"${size}x${size}"*.png 2>/dev/null | head -1)
            if [ -n "$existing" ]; then
                cp "$existing" "icons/hicolor/${size}x${size}/apps/linear.png"
            elif [ -n "$SRC_PNG" ]; then
                # Use ImageMagick 7's `magick` if available, fall back to legacy `convert`
                if command -v magick >/dev/null 2>&1; then
                    magick "$SRC_PNG" -resize "${size}x${size}" "icons/hicolor/${size}x${size}/apps/linear.png"
                else
                    convert "$SRC_PNG" -resize "${size}x${size}" "icons/hicolor/${size}x${size}/apps/linear.png"
                fi
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
    # Patch app.asar: stub the in-app auto-updater on Linux so AUR is the
    # sole source of updates (avoids 404 spam against latest-linux.yml,
    # which Linear doesn't host).
    ASAR_PATH="$(_find_asar)"
    if [ -z "$ASAR_PATH" ] || [ ! -f "$ASAR_PATH/app.asar" ]; then
        echo "ERROR: Could not find app.asar"
        exit 1
    fi

    cd "$ASAR_PATH"
    python "${srcdir}/patch-main.py"
}

package() {
    ASAR_PATH="$(_find_asar)"
    if [ -z "$ASAR_PATH" ] || [ ! -f "$ASAR_PATH/app.asar" ]; then
        echo "ERROR: Could not find app.asar"
        exit 1
    fi

    # Install app payload
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp "$ASAR_PATH/app.asar" "${pkgdir}/usr/lib/${pkgname}/"

    # Linear bundles native helper resources alongside the asar (e.g. app-update.yml)
    if [ -d "$ASAR_PATH/app.asar.unpacked" ]; then
        cp -r "$ASAR_PATH/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}/"
    fi

    # Install icons if we extracted them
    if [ -d "${srcdir}/icons/hicolor" ]; then
        install -d "${pkgdir}/usr/share/icons"
        cp -r "${srcdir}/icons/"* "${pkgdir}/usr/share/icons/"
    fi

    # Desktop entry. linear:// MimeType registers the deep-link handler so
    # Cursor/Claude Code/etc can open issues directly in the desktop app.
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Linear
GenericName=Issue Tracking
Comment=Linear desktop client
Exec=${pkgname} %u
Icon=linear
Type=Application
Terminal=false
Categories=Office;ProjectManagement;Development;
MimeType=x-scheme-handler/linear;
StartupWMClass=Linear
EOF

    # Launcher: --class & --name pin Wayland/X11 window grouping to "Linear"
    # so StartupWMClass and the icon resolve correctly.
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
exec electron --class=Linear --name=Linear /usr/lib/${pkgname}/app.asar "\$@"
EOF
}
