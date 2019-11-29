# Maintainer: Testudo Aquatilis
pkgname=nagelfar
_pkgver_main=1
_pkgver_sub=3
_pkgver_subsub=1
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
sha256sums=('13d8c6bc48d8ccf1db336680509bbf037939478a3c4538f9c9576a2d72b4c6be'
            '204d48c2f9937d3093d4e511a9f5f8eba90606fb6d9923c877a538c7f44de727'
            'ee5f6908a522bde6b94e6be56024857ecb71cc779f58ca067966299f4016057c')
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
