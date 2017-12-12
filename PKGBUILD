# Maintainer: Ľubomir 'The_K' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Stephan Friedrichs <deduktionstheorem@googlemail.com>

pkgbase='scipoptsuite'
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver='4.0.1'
pkgrel=2
pkgdesc="Toolbox for generating and solving optimization problems."
arch=('x86_64')
url='http://scip.zib.de'
license=('LGPL3' 'custom:ZIB Academic License')
replaces=('ziboptsuite')
_depends=('gmp' 'readline' 'zlib')
makedepends=('bison' 'cmake' 'flex' "${_depends[@]}")
_provides=('scip=4.0.1' 'soplex=3.0.1' 'zimpl=3.3.4')
source=("http://scip.zib.de/download/release/${pkgbase}-${pkgver}.tgz")
sha256sums=('72f2a0d79f3f8b615ad98fba6343d03ebbf644a6ba089ad6ad47577e189e2946')

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

check() {
    cd "${srcdir}/${pkgbase}-${pkgver}/build"

    make check
}

_package() {
    depends=("${_depends[@]}")
    provides=("${_provides[@]}")

    cd "${srcdir}/${pkgbase}-${pkgver}/build"

    make install DESTDIR="${pkgdir}"

    install -D -m644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_package-docs() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    #
    # Documentation
    #
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"{scip,soplex,zimpl,gcg,ug}
    cp -r scip/{CHANGELOG,release-notes} "${pkgdir}/usr/share/doc/${pkgname}/scip/"
    cp -r soplex/CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/soplex/"
    install -m644 soplex/src/example.cpp "${pkgdir}/usr/share/doc/${pkgname}/soplex/"
    cp -r zimpl/{CHANGELOG,README,doc,example} "${pkgdir}/usr/share/doc/${pkgname}/zimpl/"
    cp -r gcg/{CHANGELOG,README.md} "${pkgdir}/usr/share/doc/${pkgname}/gcg/"
    cp -r ug/README "${pkgdir}/usr/share/doc/${pkgname}/ug/"

    #
    # License
    #
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _pkg in ${pkgname[@]}; do
    eval "package_${_pkg}() {
        $(declare -f "_package${_pkg#${pkgbase}}")
        _package${_pkg#${pkgbase}}
    }"
done
