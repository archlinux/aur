# Maintainer: Testudo Aquatilis
pkgname=nagelfar
_pkgver_main=1
_pkgver_sub=3
_pkgver_subsub=2
_pkgver="${_pkgver_main}${_pkgver_sub}${_pkgver_subsub}"
pkgver="${_pkgver_main}.${_pkgver_sub}.${_pkgver_subsub}"
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
sha256sums=('ff704e551efa2f39ba851ce9f02cc8ab66c7fae39fb41d5aa2abd6fe05c76b72'
            'e0465caec7c7d735a61cf925371ba56a76b6850e2098d44b1887579ea2cc8d6c'
            '19aa5b8a3fd6d14ba7c4fe3dd9d277ba70a4e17096e29bacc716d82bb7b26e76')
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
