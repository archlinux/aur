# Maintainer: Andrej Radovic <r.andrej@gmail.com>
pkgname="kicadlibrarian-git"
pkgver=20210323.c075e16
pkgrel=1
pkgdesc="A utility to manage and maintain KiCad libraries with schematic symbols and footprints"
arch=('i686' 'x86_64')
url="https://github.com/compuphase/KiCad-Librarian"
license=('Apache')
depends=(desktop-file-utils wxgtk3 curl libharu)
makedepends=(git make cmake)
install=kicadlibrarian-git.install
provides=("kicadlibrarian")
conflicts=("kicadlibrarian")
source=("${pkgname}"'::git+git://github.com/randrej/KiCad-Librarian.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd "$srcdir/$pkgname/src"
  sed -ie "s#/usr/share/#${pkgdir}/usr/share/#" CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/opt/${pkgname} -DKiCadLibrarian_USE_CX3D=0 -DKiCadLibrarian_USE_CURL=1
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  sed -ie "s#^Exec=.*\$#Exec=/opt/${pkgname}/bin/kicadlibrarian#" kicadlibrarian.desktop
  mkdir -p ${pkgdir}/usr/share/applications/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/48x48/
  mkdir -p ${pkgdir}/usr/share/mime/packages
  install -Dm644 kicadlibrarian.desktop ${pkgdir}/usr/share/applications/
  install -Dm644 ../kicadlibrarian32.png ${pkgdir}/usr/share/icons/hicolor/48x48/
  install -Dm644 ../kicadlibrarian.xml ${pkgdir}/usr/share/mime/packages
  make install
  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/${pkgname}/bin/kicadlibrarian $pkgdir/usr/bin
}
