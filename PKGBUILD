# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=pi-studio-bin
pkgver=0.1.28
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

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_relurl}/PiStudio_${pkgver}_amd64.deb")
sha256sums_x86_64=('b2efa2aad2f59a6c4927cc8c5fc5a81d8fdb749beda13c351132be9543819888')
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_relurl}/PiStudio_${pkgver}_arm64.deb")
sha256sums_aarch64=('e6d3945385659ffacd626e9259a6570ee5b13df36ecf850ce10aefb983dae5cb')

prepare() {
    mkdir -p "${srcdir}/data"
    cd "${srcdir}/data"
    ar x "${srcdir}/${pkgname}-${pkgver}-${CARCH}.deb"
    tar xzf data.tar.gz
}

package() {
    cd "${srcdir}/data"

    install -Dm755 usr/bin/pi-studio "${pkgdir}/usr/bin/pi-studio"

    install -d "${pkgdir}/usr/lib/PiStudio"
    cp -a usr/lib/PiStudio/. "${pkgdir}/usr/lib/PiStudio/"

    install -Dm644 usr/share/icons/hicolor/32x32/apps/pi-studio.png \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/pi-studio.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/pi-studio.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pi-studio.png"
    if [[ -d usr/share/icons/hicolor/256x256@2 ]]; then
        install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/pi-studio.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pi-studio.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/pi-studio.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Pi Studio
Comment=Local Codex-style desktop GUI for the Pi coding agent
Exec=pi-studio
Icon=pi-studio
Terminal=false
Categories=Development;
StartupWMClass=pi-studio
EOF

    # Upstream declares MIT in package.json but ships no LICENSE file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
