# Maintainer: devome <evinedeng@hotmail.com>

pkgname=mdcx
pkgver=120240924
pkgrel=1
pkgdesc="Movie metadata scraper"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/sqzw-x/${pkgname}"
license=("GPL-3.0-or-later")
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=("python39")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('cadde35d727ecb18f19465f6991554824ec55d05cbff361a07ecfe000b72a873'
            '90a66bc7a210b3f3d574a5050e27114aa1fc4d60479d359424d57b20b1526f23'
            'bd10755b15288986c03168ba8dd13d9f762fa128ded082d14b036d0934e9f05d')

build() {
    cd "${pkgname}-${pkgver}"
    python3.9 -m venv .venv
    source ./.venv/bin/activate
    pip install pyinstaller
    pip install -r requirements.txt
    pyi-makespec -F \
        -n "$pkgname" \
        -w main.py \
        -p "./src" \
        --add-data "resources:resources" \
        --add-data "libs:." \
        --hidden-import socks \
        --hidden-import urllib3 \
        --hidden-import _cffi_backend \
        --collect-all curl_cffi
    pyinstaller "${pkgname}.spec"
}

package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "dist/${pkgname}"    "${pkgdir}/usr/bin/${pkgname}"
}
