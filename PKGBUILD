# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Thomas Pani <thomas.pani@gmail.com>

_pkgname=ocaml-fileutils
pkgname=${_pkgname}-yypkg
_pkgver=0.4.5
_oldver=0.4.4
_yypkgver=1.9.0
pkgver=${_pkgver}yypkg${_yypkgver}
pkgrel=1
pkgdesc="A library to provide pure OCaml functions to manipulate real file and filename (with yypkg patches)"
arch=('i686' 'x86_64')
url="http://forge.ocamlcore.org/projects/ocaml-fileutils"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib' 'ocaml-ounit')
provides=("${_pkgname}=${_pkgver}")
conflicts=("${_pkgname}")
source=("http://forge.ocamlcore.org/frs/download.php/892/ocaml-fileutils-0.4.5.tar.gz"
        "http://win-builds.org/yypkg/yypkg-${_yypkgver}.tar.xz")
md5sums=('1f43b9333358f47660318bfbe9ae68bf'
         'f1613c5ef9ccffc26370f743cbb8cae7')

prepare() {
  cd "${srcdir}/${_pkgname}-${_oldver}"

  patch -Np1 < "${srcdir}/yypkg-${_yypkgver}/fileutils-symlink-patches/0001-FileUtil-replace-stat.is_link-boolean-with-a-Link-va.patch"
  patch -Np1 < "${srcdir}/yypkg-${_yypkgver}/fileutils-symlink-patches/0002-FileUtil-symlinks-patch-2.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${_oldver}"

  ./configure --disable-debug --prefix /usr --destdir "${pkgdir}"
  make all
}

package() {
  cd "${srcdir}/${_pkgname}-${_oldver}"

  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  install -dm755 "${OCAMLFIND_DESTDIR}"
  make install
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
