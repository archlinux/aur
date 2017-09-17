# Maintainer: Ľubomir 'The_K' Kučera <lubomir-kucera-jr-at-gmail-dot-com>
# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Stephan Friedrichs <deduktionstheorem@googlemail.com>

pkgbase='scipoptsuite'
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver='4.0.1'
pkgrel=1
pkgdesc="Toolbox for generating and solving optimization problems."
arch=('i686' 'x86_64')
url='http://scip.zib.de'
license=('LGPL3' 'custom:ZIB Academic License')
replaces=('ziboptsuite')
_depends=('zlib' 'gmp' 'readline')
makedepends=('chrpath' 'doxygen' 'graphviz' "${_depends[@]}")
_provides=('scip=4.0.1' 'soplex=3.0.1' 'zimpl=3.3.4' 'gcg=2.1.2' 'ug=0.8.4')
source=("http://scip.zib.de/download/release/${pkgbase}-${pkgver}.tgz")
sha256sums=('72f2a0d79f3f8b615ad98fba6343d03ebbf644a6ba089ad6ad47577e189e2946')

prepare() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    # Fix ZIMPL linking
    sed -i 's/LDFLAGS\s*+=\s*-static//g' zimpl/make/make.linux.*
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    make SHARED=true scipoptlib
    make
    make BLISS=false gcg
    make ug

    for _pkg in scip soplex gcg; do
        cd "${srcdir}/${pkgbase}-${pkgver}/${_pkg}"

        make doc -j
    done

    # Some files have permission 640.
    # @FIXME: Future versions might not require this line.
    chmod -R a+r "${srcdir}/${pkgbase}-${pkgver}"
}

check() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    make test
}

_package() {
    depends=("${_depends[@]}")
    provides=("${_provides[@]}")

    # install everything manually (the install targets are still broken)
    cd "${srcdir}/${pkgbase}-${pkgver}"

    # A local RPATH is set, get rid of it.
    chrpath --delete scip/bin/scip
    chrpath --delete soplex/bin/soplex
    chrpath --delete gcg/bin/gcg
    chrpath --delete ug/bin/fscip

    #
    # Binaries
    #
    install -D -m755 soplex/bin/soplex "${pkgdir}/usr/bin/soplex"
    install -D -m755 scip/bin/scip "${pkgdir}/usr/bin/scip"
    install -D -m755 zimpl/bin/zimpl "${pkgdir}/usr/bin/zimpl"
    install -D -m755 gcg/bin/gcg "${pkgdir}/usr/bin/gcg"
    install -D -m755 ug/bin/fscip "${pkgdir}/usr/bin/fscip"

    #
    # Includes
    #
    mkdir -p "${pkgdir}/usr/include/"{blockmemshell,lpi,nlpi,objscip,scip,soplex,zimpl}
    cp scip/src/blockmemshell/*.h "${pkgdir}/usr/include/blockmemshell"
    cp scip/src/lpi/*.h "${pkgdir}/usr/include/lpi"
    cp scip/src/nlpi/*.h "${pkgdir}/usr/include/nlpi"
    cp scip/src/objscip/*.h "${pkgdir}/usr/include/objscip"
    cp scip/src/scip/*.h "${pkgdir}/usr/include/scip"
    cp soplex/src/*.h "${pkgdir}/usr/include/soplex"
    cp zimpl/src/zimpl/*.h "${pkgdir}/usr/include/zimpl"

    #
    # Libraries
    #
    mkdir -p "${pkgdir}/usr/lib/"
    cp -d scip/lib/shared/libscip*.so "${pkgdir}/usr/lib/"
    cp -d soplex/lib/libsoplex*.so "${pkgdir}/usr/lib/"
    cp -d zimpl/lib/libzimpl*.a "${pkgdir}/usr/lib/"
    cp -d lib/libscipopt*.so "${pkgdir}/usr/lib/"

    # Repair "missing links"
    # @FIXME: I hope this is not necessary in future versions!
    cd "${pkgdir}/usr/lib"
    ln -s -T libzimpl-*.a libzimpl.a
    cd "${srcdir}/${pkgbase}-${pkgver}"

    #
    # License
    #
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_package-docs() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    #
    # Documentation
    #
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"{scip,soplex,zimpl,gcg,ug}
    cp -r scip/{CHANGELOG,release-notes,doc/html} "${pkgdir}/usr/share/doc/${pkgname}/scip/"
    cp -r soplex/{CHANGELOG,doc/html} "${pkgdir}/usr/share/doc/${pkgname}/soplex/"
    install -m644 soplex/src/example.cpp "${pkgdir}/usr/share/doc/${pkgname}/soplex/"
    cp -r zimpl/{CHANGELOG,README,doc,example} "${pkgdir}/usr/share/doc/${pkgname}/zimpl/"
    cp -r gcg/{CHANGELOG,doc/html} "${pkgdir}/usr/share/doc/${pkgname}/gcg/"
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
