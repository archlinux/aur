# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=mdcx
pkgname="${_pkgname}-git"
pkgver=120240924.r156.e5c0df9
pkgrel=1
pkgdesc="Movie metadata scraper"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/sqzw-x/${_pkgname}"
license=("GPL-3.0-or-later")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=("python39")
source=("${_pkgname}::git+${url}.git"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
sha256sums=('SKIP'
            '90a66bc7a210b3f3d574a5050e27114aa1fc4d60479d359424d57b20b1526f23'
            'bd10755b15288986c03168ba8dd13d9f762fa128ded082d14b036d0934e9f05d')

pkgver() {
    cd "${_pkgname}"
    printf "%s.r%s.%s" "$(awk '/version = /{print $3}' config.ini.default)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    python3.9 -m venv .venv
    source ./.venv/bin/activate
    pip install pyinstaller
    pip install -r requirements.txt
    pyi-makespec -F \
        -n "$_pkgname" \
        -w main.py \
        -p "./src" \
        --add-data "resources:resources" \
        --add-data "libs:." \
        --hidden-import socks \
        --hidden-import urllib3 \
        --hidden-import _cffi_backend \
        --collect-all curl_cffi
    pyinstaller "${_pkgname}.spec"
}

package() {
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

    cd "${_pkgname}"
    install -Dm755 "dist/${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
}
