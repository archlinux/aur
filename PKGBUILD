# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=mdcx
pkgname="${_pkgname}-git"
epoch=1
pkgver=r391.5f0b12d
pkgrel=1
pkgdesc="Movie metadata scraper"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/sqzw-x/${_pkgname}"
license=("GPL-3.0-or-later")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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
makedepends=("git" "python" "uv")
source=("${_pkgname}::git+${url}.git"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
sha256sums=('SKIP'
            '90a66bc7a210b3f3d574a5050e27114aa1fc4d60479d359424d57b20b1526f23'
            'bd10755b15288986c03168ba8dd13d9f762fa128ded082d14b036d0934e9f05d')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
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
        --name "${_pkgname}" \
        --onefile \
        --paths "./${_pkgname}" \
        --windowed main.py
    pyinstaller "${_pkgname}.spec"
}

package() {
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

    cd "${_pkgname}"
    install -Dm755 "dist/${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
}
