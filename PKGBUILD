# Maintainer: Kaare Jenssen <kaare at jenssen dot it>
# Contributor: Benjamin James <bjames@openmailbox.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=clx-git
_clname=clx
pkgver=r320.c2931ec
pkgrel=1
arch=('any')
pkgdesc="An X11 client for Common Lisp"
url="https://github.com/sharplispers/clx"
license=('custom')
provides=('clx')
conflicts=('clx')
depends=('xorg-server' 'sbcl')
makedepends=('git' 'texinfo')
install=clx.install
source=(${pkgname}::git+https://github.com/sharplispers/clx.git
        README.licensing)
md5sums=('SKIP'
         '74858379015567928f1eee186d9db1a4')

pkgver() {
    cd ${srcdir}/${pkgname}

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname}/manual

    makeinfo ${_clname}.texinfo
}

package() {
    cd ${srcdir}/${pkgname}

    install -d        ${pkgdir}/usr/share/common-lisp/source/${_clname}
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} *.lisp
    install -d        ${pkgdir}/usr/share/common-lisp/source/${_clname}/extensions
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/extensions extensions/*.lisp
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} ${_clname}.asd
    install -d        ${pkgdir}/usr/share/common-lisp/source/${_clname}/debug
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/debug debug/*.lisp
    install -d        ${pkgdir}/usr/share/common-lisp/source/${_clname}/demo
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/demo demo/*.lisp
    install -d        ${pkgdir}/usr/share/common-lisp/source/${_clname}/test
    install -d        ${pkgdir}/usr/share/info
    install -m 644 -t ${pkgdir}/usr/share/info manual/${_clname}.info
    install -d        ${pkgdir}/usr/share/licenses/$pkgname
    install -m 644 -t ${pkgdir}/usr/share/licenses/$pkgname ${srcdir}/README.licensing

    install -d ${pkgdir}/usr/share/common-lisp/systems
    cd         ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}
