# Maintainer: Ľubomir 'The_K' Kučera <lubomir-kucera-jr-at-gmail-dot-com>
# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Stephan Friedrichs <deduktionstheorem@googlemail.com>

pkgbase='scipoptsuite'
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver='4.0.0'
pkgrel=3
pkgdesc="Toolbox for generating and solving optimization problems."
arch=('i686' 'x86_64')
url='http://scip.zib.de'
license=('LGPL3' 'custom:ZIB Academic License')
replaces=('ziboptsuite')
_depends=('zlib' 'gmp' 'readline')
makedepends=('chrpath' 'doxygen' 'graphviz' "${_depends[@]}")
_provides=('scip=4.0.0' 'soplex=3.0.0' 'zimpl=3.3.4' 'gcg=2.1.2' 'ug=0.8.3')
source=("http://scip.zib.de/download/release/${pkgbase}-${pkgver}.tgz")
sha256sums=('087535760eae3d633e2515d942a9b22e1f16332c022be8d093372bdc68e8a661')

# Extract directory names from the $provides array.
_scip="${_provides[0]//=/-}"
_soplex="${_provides[1]//=/-}"
_zimpl="${_provides[2]//=/-}"
_gcg="${_provides[3]//=/-}"
_ug="${_provides[4]//=/-}"

prepare() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    # Unpack and remove archives, otherwise patching wouldn't be possible
    for _pkg in "${_provides[@]}"; do
        _archive="${_pkg//=/-}.tgz"

        tar xzf "${_archive}"

        rm "${_archive}"
    done

    # Fix ZIMPL linking
    sed -i 's/LDFLAGS		+=	-static//g' ${_zimpl}/make/make.linux.*
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    make SHARED=true scipoptlib
    make
    make BLISS=false gcg
    make ug

    cd "${srcdir}/${pkgbase}-${pkgver}/${_scip}"
    make doc -j

    cd "${srcdir}/${pkgbase}-${pkgver}/${_soplex}"
    make doc -j

    cd "${srcdir}/${pkgbase}-${pkgver}/${_gcg}"
    make doc -j

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
    chrpath --delete ${_scip}/bin/scip
    chrpath --delete ${_soplex}/bin/soplex
    chrpath --delete ${_gcg}/bin/gcg
    chrpath --delete ${_ug}/bin/fscip

    #
    # Binaries
    #
    install -D -m755 ${_soplex}/bin/soplex "${pkgdir}/usr/bin/soplex"
    install -D -m755 ${_scip}/bin/scip "${pkgdir}/usr/bin/scip"
    install -D -m755 ${_zimpl}/bin/zimpl "${pkgdir}/usr/bin/zimpl"
    install -D -m755 ${_gcg}/bin/gcg "${pkgdir}/usr/bin/gcg"
    install -D -m755 ${_ug}/bin/fscip "${pkgdir}/usr/bin/fscip"

    #
    # Includes
    #
    mkdir -p "${pkgdir}/usr/include/"{blockmemshell,lpi,nlpi,objscip,scip,soplex,zimpl}
    cp ${_scip}/src/blockmemshell/*.h "${pkgdir}/usr/include/blockmemshell"
    cp ${_scip}/src/lpi/*.h "${pkgdir}/usr/include/lpi"
    cp ${_scip}/src/nlpi/*.h "${pkgdir}/usr/include/nlpi"
    cp ${_scip}/src/objscip/*.h "${pkgdir}/usr/include/objscip"
    cp ${_scip}/src/scip/*.h "${pkgdir}/usr/include/scip"
    cp ${_soplex}/src/*.h "${pkgdir}/usr/include/soplex"
    cp ${_zimpl}/src/*.h "${pkgdir}/usr/include/zimpl"

    #
    # Libraries
    #
    mkdir -p "${pkgdir}/usr/lib/"
    cp -d ${_scip}/lib/shared/libscip*.so "${pkgdir}/usr/lib/"
    cp -d ${_soplex}/lib/libsoplex*.so "${pkgdir}/usr/lib/"
    cp -d ${_zimpl}/lib/libzimpl*.a "${pkgdir}/usr/lib/"
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
    cp -r ${_scip}/{CHANGELOG,release-notes,doc/html} "${pkgdir}/usr/share/doc/${pkgname}/scip/"
    cp -r ${_soplex}/{CHANGELOG,doc/html} "${pkgdir}/usr/share/doc/${pkgname}/soplex/"
    install -m644 ${_soplex}/src/example.cpp "${pkgdir}/usr/share/doc/${pkgname}/soplex/"
    cp -r ${_zimpl}/{CHANGELOG,README,doc,example} "${pkgdir}/usr/share/doc/${pkgname}/zimpl/"
    cp -r ${_gcg}/{CHANGELOG,doc/html} "${pkgdir}/usr/share/doc/${pkgname}/gcg/"
    cp -r ${_ug}/README "${pkgdir}/usr/share/doc/${pkgname}/ug/"

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
