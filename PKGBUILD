# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=keircn
_pkgname=hostman
pkgname=${_pkgname}-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="A simple file host manager for various image hosting services"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedeps=('xdelta3')
depends=('cjson' 'sqlite' 'openssl' 'curl' 'glibc' 'ncurses')

changelog="changelog.md"

source=("fix_libncurses_x86_64.patch"
        "MAN-${pkgver}.1::${_urlraw}/man/${_pkgname}.1"
        "MAN-CONFIG-${pkgver}.5::${_urlraw}/man/${_pkgname}-config.5")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.gz")
sha256sums=('e0e9081ab0803c530dbd3291b6d76b28a8837645b75e38aa64684267c76aec61'
            'd01fa445be92a98ffad2d9efecd787666dd301a678c209756db8c9a74ff47dd1'
            'b04f38243a5041fc3dce4e28924e13eb036e4750012eec032197e4b90dea0ad8')
sha256sums_x86_64=('2708dafa3f141c8c35d5390dfa6fc65816a6f09ca69ef47388e6a9552b2460cd')

prepare() {
    cd "${srcdir}/${_pkgname}-linux-x64" || exit

    xdelta3 -d -f -s "${_pkgname}" "../fix_libncurses_x86_64.patch" "${_pkgname}"
}

package() {
    cd "${srcdir}/${_pkgname}-linux-x64" || exit

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "../MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
    install -Dm644 "../MAN-CONFIG-${pkgver}.5" "${pkgdir}/usr/share/man/man5/${_pkgname}-config.5"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
