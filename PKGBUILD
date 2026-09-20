# Maintainer: darthmaul86 <pitepana@gmail.com>
pkgname=mister-companion-bin
_pkgname=mister-companion
pkgver=8.3.1
pkgrel=1
pkgdesc="Companion utility for managing and syncing MiSTer FPGA setups (Official pre-built binary with full Cloud & Scraper support)"
arch=('x86_64')
url="https://github.com/Anime0t4ku/mister-companion"
license=('GPL-2.0-only')
depends=('zlib' 'glibc' 'fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${url}/releases/download/v${pkgver}/MiSTer-Companion-Linux-x86_64.tar.gz")
sha256sums=('885092095b81b69f7bbb479047424c7bec6d8e3b07cc90189c97b0e97c3c6863')

package() {
    cd "${srcdir}"

    # 1. Εγκατάσταση των binary αρχείων στο /usr/lib/mister-companion ως template
    install -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -r ./* "${pkgdir}/usr/lib/${_pkgname}/" 2>/dev/null || cp -r . "${pkgdir}/usr/lib/${_pkgname}/"

    # 2. Wrapper script που συγχρονίζει/εκτελεί τα binaries στο ~/.local/share/mister-companion
    install -d "${pkgdir}/usr/bin"
    cat << 'EOF' > "${pkgdir}/usr/bin/mister-companion"
#!/bin/sh
APP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/mister-companion"
mkdir -p "$APP_DIR"

# Copy/sync binary files to user space so write permissions work natively
rsync -a --update /usr/lib/mister-companion/ "$APP_DIR/" 2>/dev/null || cp -rn /usr/lib/mister-companion/* "$APP_DIR/"

cd "$APP_DIR"
exec ./MiSTer-Companion "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/mister-companion"

    # 3. Εγκατάσταση εικονιδίου
    if [ -f "${pkgdir}/usr/lib/${_pkgname}/resources/icon.png" ]; then
        install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/resources/icon.png" \
            "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    elif [ -f "${pkgdir}/usr/lib/${_pkgname}/icon.png" ]; then
        install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/icon.png" \
            "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    fi

    # 4. Δημιουργία Desktop Shortcut
    install -d "${pkgdir}/usr/share/applications"
    cat << EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=MiSTer Companion
Comment=Companion utility for managing and syncing MiSTer FPGA setups
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Utility;Settings;
EOF
}
