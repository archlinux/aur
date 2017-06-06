# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=ocaml-archive
pkgname=${_pkgname}-yypkg
_pkgver=2.8.4+2
_yypkgver=1.9.0
pkgver=${_pkgver}yypkg${_yypkgver}
pkgrel=1
pkgdesc="Bindings to libarchive with Lwt support (with yypkg patches)"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/ocaml-archive/"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-fileutils' 'ocaml-lwt' 'ocaml-extlib' 'libarchive')
makedepends=('ocaml-findlib' 'ocaml-ounit')
provides=("${_pkgname}=${_pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
source=("https://forge.ocamlcore.org/frs/download.php/1129/ocaml-archive-2.8.4+2.tar.gz"
        "http://win-builds.org/yypkg/yypkg-${_yypkgver}.tar.xz")
md5sums=('5be75adde03a871c36f8a9ddacbba844'
         'f1613c5ef9ccffc26370f743cbb8cae7')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  patch -Np1 < "${srcdir}/yypkg-${_yypkgver}/archive-patches/0001-_oasis-make-it-possible-to-not-build-tests-docs-and-.patch"
  patch -Np1 < "${srcdir}/yypkg-${_yypkgver}/archive-patches/0002-Bind-extract-set_pathname-and-read_open_memory-strin.patch"
  patch -Np1 < "${srcdir}/yypkg-${_yypkgver}/archive-patches/0003-stubs-bind-archive_entry_-set_-pathname-through-a-ma.patch"
  patch -Np1 < "${srcdir}/yypkg-${_yypkgver}/archive-patches/0004-Bind-archive_entry_-set_-hard-sym-link-and-archive_e.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  ./configure
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  make install
}
