# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=c3c-bin
_pkgname=c3c
pkgver=0.7.8
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible. Stable Release"
arch=(x86_64)
url="https://github.com/c3lang/c3c.git"
license=('LGPL3' 'MIT')
depends=()
makedepends=('binutils')
provides=('c3c')
conflicts=('c3c' 'c3c-git')
source=("https://github.com/c3lang/c3c/releases/download/v$pkgver/c3-linux.tar.gz")

md5sums=('21fdabb101dea3d40c228312feada492')

prepare() {

  echo ""
  echo "              WARNING: Due to a current incompatibility with ArchLinux"
  echo "       a Symbolic link to libxml2 will be installed at /usr/lib/libxml2.so.2"
  echo "                       PLEASE CHECK THERE IS NO CONFLICT!!!!!"
  echo ""

}

pkgver() {
  cd "${srcdir}/c3"

  # libxml2 compatibility...
  rm libxml2.so.2 || true
  ln -s /usr/lib/libxml2.so libxml2.so.2

  ./c3c -V | grep "C3 Compiler Version" | tr -s " " | cut -f 2 -d ':' | cut -f 2 -d " "
}

package() {
  cd "${srcdir}/c3/"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_pkgname}"

  # libxml2 compatibility
  cp "${srcdir}/c3/libxml2.so.2" "${pkgdir}/usr/lib/libxml2.so.2"

  cp "${srcdir}/c3/c3c" "${pkgdir}/usr/lib/${_pkgname}/c3c"
  cp -r "${srcdir}/c3/lib" "${pkgdir}/usr/lib/${_pkgname}/lib"
  ln -s "/usr/lib/${_pkgname}/c3c" "${pkgdir}/usr/bin/c3c"
}
