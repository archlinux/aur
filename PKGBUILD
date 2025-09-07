# Maintainer: devome <evinedeng@hotmail.com>

pkgname=mdcx
pkgver=220250909
pkgrel=1
pkgdesc="Movie metadata scraper"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/sqzw-x/${pkgname}"
license=("GPL-3.0-or-later")
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    "at-spi2-core"
    "cairo"
    "ffmpeg"
    "fontconfig"
    "freetype2"
    "gdk-pixbuf2"
    "gtk3"
    "libx11"
    "libxcb"
    "libxkbcommon"
    "libxkbcommon-x11"
    "libxcomposite"
    "libxext"
    "mpdecimal"
    "pango"
    "xcb-util-image"
    "xcb-util-keysyms"
    "xcb-util-renderutil"
    "xcb-util-wm"
)
makedepends=("python" "uv")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('3564556cab3347f7ea49a9d71b086deaade22e4a38bc890e45348a444fe6d46d'
            '90a66bc7a210b3f3d574a5050e27114aa1fc4d60479d359424d57b20b1526f23'
            'bd10755b15288986c03168ba8dd13d9f762fa128ded082d14b036d0934e9f05d')

build() {
    cd "${pkgname}-${pkgver}"
    uv sync \
        --frozen \
        --no-cache \
        --no-editable \
        --no-install-project \
        --active
    source .venv/bin/activate
    pyi-makespec \
        --add-data "resources:resources" \
        --collect-all "curl_cffi" \
        --hidden-import "_cffi_backend" \
        --name "${pkgname}" \
        --onefile \
        --paths "./${pkgname}" \
        --windowed main.py
    pyinstaller "${pkgname}.spec"
}

package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "dist/${pkgname}"    "${pkgdir}/usr/bin/${pkgname}"
}
