# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=pi-studio-bin
pkgver=0.1.32
pkgrel=1
pkgdesc="Local Codex-style desktop GUI for the Pi coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/shixin-guo/pi-studio"
license=('MIT')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gcc-libs'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
provides=('pi-studio')
conflicts=('pi-studio')
options=('!strip' '!debug')

_relurl="${url}/releases/download/v${pkgver}"

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_relurl}/Picot_${pkgver}_amd64.deb")
sha256sums_x86_64=('75b54f8c2d73ad1a8eb7b123daf57635c659ea4cc01a30962885d21c5bee5a43')
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_relurl}/Picot_${pkgver}_arm64.deb")
sha256sums_aarch64=('531067f2627e08d0b6ad5dd5d0175f4ec375e19c2032441a7f4d65cff7e8c9e3')

prepare() {
    mkdir -p "${srcdir}/data"
    cd "${srcdir}/data"
    ar x "${srcdir}/${pkgname}-${pkgver}-${CARCH}.deb"
    tar xzf data.tar.gz
}

package() {
    cd "${srcdir}/data"

    install -Dm755 usr/bin/picot "${pkgdir}/usr/bin/pi-studio"

    install -d "${pkgdir}/usr/lib/Picot"
    cp -a usr/lib/Picot/. "${pkgdir}/usr/lib/Picot/"

    install -Dm644 usr/share/icons/hicolor/32x32/apps/picot.png \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/pi-studio.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/picot.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pi-studio.png"
    if [[ -d usr/share/icons/hicolor/256x256@2 ]]; then
        install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/picot.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pi-studio.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/pi-studio.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Picot
Comment=Local Codex-style desktop GUI for the Pi coding agent
Exec=pi-studio
Icon=pi-studio
Terminal=false
Categories=Development;
StartupWMClass=picot
EOF

    # Upstream declares MIT in package.json but ships no LICENSE file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
