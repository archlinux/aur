# Maintainer: Testudo Aquatilis
pkgname=nagelfar
_pkgver_main=1
_pkgver_sub=3
_pkgver_subsub=0
pkgver="${_pkgver_main}.${_pkgver_sub}.${_pkgver_subsub}"
_pkgver="${_pkgver_main}${_pkgver_sub}${_pkgver_subsub}"
pkgrel=1
epoch=
pkgdesc="Tcl syntax checker"
arch=('any')
url="http://nagelfar.sourceforge.net/"
license=('GPL')
groups=()
depends=("tcl")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/nagelfar/Rel_${_pkgver}/${pkgname}${_pkgver}.tar.gz" nagelfar-paths.patch doc-syntaxdatabase.patch)
noextract=()
md5sums=('b6405edd980c714d39e425f8311368b2'
         '53bcf49957b3a79c87c411e89824b6c5'
         '48f75a0c131cc17df6b38a2f5967c7e4')
validpgpkeys=()


prepare() {
    cd ${pkgname}${_pkgver}
    patch -Np1 -i "${srcdir}/doc-syntaxdatabase.patch"
    patch -Np1 -i "${srcdir}/nagelfar-paths.patch"
}

package() {
    cd ${pkgname}${_pkgver}

    # install script, removing trailing .tcl
    install -D -m755 ${pkgname}.tcl ${pkgdir}/usr/bin/${pkgname}

    # install libs
    lib_path="/usr/lib/${pkgname}"
    install -d -m755 "${pkgdir}${lib_path}"

    # textsearch package
    for file_path in "lib/textsearch/tcl/textsearch.tcl" "lib/textsearch/pkgIndex.tcl" ; do
        install -D -m644 "${file_path}" "${pkgdir}${lib_path}/${file_path}"
    done

    # packagedb
    install -d -m755 "${pkgdir}${lib_path}/packagedb"
    for p in packagedb/* ; do
        install -m644 $p "${pkgdir}${lib_path}/packagedb"
    done

    # syntax stuff
    for file in {syntax*.tcl,*.syntax} ; do
        install -D -t "${pkgdir}${lib_path}" -m644 "${file}"
    done

    # doc
    doc_path="/usr/share/doc/${pkgname}"
    install -d -m755 "${pkgdir}${doc_path}"
    for d in doc/* ; do
        install -m644 $d "${pkgdir}${doc_path}"
    done

    # license
    lic_path="/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}${lic_path}"
    install -m644 "COPYING" "${pkgdir}${lic_path}"
}
