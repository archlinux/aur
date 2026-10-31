# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=keircn
_pkgname=hostman
pkgname=${_pkgname}-bin
pkgdesc="A simple file host manager for various image hosting services"
pkgver=1.2.7
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64')
license=('MIT')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedeps=('xdelta3')
depends=('cjson' 'sqlite' 'openssl' 'curl' 'glibc' 'ncurses')

source=("fix_libncurses_x86_64.patch"
        "MAN-${pkgver}.1::${_urlraw}/man/${_pkgname}.1"
        "MAN-CONFIG-${pkgver}.5::${_urlraw}/man/${_pkgname}-config.5")
source_x86_64=("${pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.gz")
b2sums=('87010881eca48a8d4dfdcf7e15a4c7bc6c39ae325c31495e9376040f6e94a5802c7af84b6d4eaf4131d8302cc2b5ee0c235562f32665c8c5e9f3f745ec718e44'
        '4988420d34019257294fd4c31e6a3b26c7574dc96f875a1cc56be7548ebda26861d2d223785f9bc1da93e057981e97c9ac4aec7d5c57a9b590bd99cecb1ac274'
        '72625a3934226274e47cacb5de63788688c0913b24c89b6afd6387e1d0c3020848e6490e005b4da2777f90bf838e99f0ce3053acd98c0590a73552eda4904bad')
b2sums_x86_64=('6fd44833d982a93a31dcb4824f5ad3e4159404b5c169f84e3404fadbb11b0eacdda03b54d30a187b1e11636dbeb46982a78de73c9b1a0778b356679f643716c8')

prepare() {
    cd "${srcdir}/${_pkgname}-linux-x64" || exit

    xdelta3 -d -f -s "${_pkgname}" "../fix_libncurses_x86_64.patch" "${_pkgname}"
}

package() {
    cd "${srcdir}/${_pkgname}-linux-x64" || exit

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "../MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
    install -Dm644 "../MAN-CONFIG-${pkgver}.5" "${pkgdir}/usr/share/man/man5/${_pkgname}-config.5"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
