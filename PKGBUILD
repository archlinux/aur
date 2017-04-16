# Maintainer: Andrej Radovic <r.andrej@gmail.com>
pkgname=kicadlibrarian-git
pkgver=r21.d7c0c4e
pkgrel=1
pkgdesc="A utility to manage and maintain KiCad libraries with schematic symbols and footprints"
arch=('i686' 'x86_64')
url="http://www.compuphase.com/electronics/kicadlibrarian_en.htm"
license=('Apache')
depends=(desktop-file-utils gcc-libs-multilib wxgtk curl libharu)
makedepends=(git make cmake)
provides=("kicadlibrarian")
conflicts=("kicadlibrarian")
source=("${pkgname}"'::git+git://github.com/compuphase/KiCad-Librarian.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/src"
  sed -ie "s#/usr/share/#${pkgdir}/usr/share/#" CMakeLists.txt
  sed -ie "s#/doc/LICENSE#/LICENSE#" CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/opt/kicadlibrarian -DKiCadLibrarian_USE_CX3D=0 -DKiCadLibrarian_USE_CURL=1
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  cp ../kicadlibrarian.desktop .
  cp ../kicadlibrarian.xml .
  cp ../kicadlibrarian32.png .
  make install
  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/kicadlibrarian/bin/kicadlibrarian $pkgdir/usr/bin
}
