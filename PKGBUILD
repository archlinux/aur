# Maintainer: Julien Savard <juju@juju2143.ca>
# Contributor: Nathaniel van Diepen <eeems@eeems.codes>

pkgname=ticemu-git
pkgver=1.3.r29.g4f8e0406
pkgrel=2
url='https://ce-programming.github.io/CEmu/'
makedepends=('git')
depends=('qt5-base' 'libarchive')
pkgdesc='Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer features'
license=('GPL')
arch=('x86_64')
source=("$pkgname::git+https://github.com/CE-Programming/CEmu.git"
	"git+https://github.com/CE-Programming/zdis.git"
	"git+https://github.com/adriweb/tivars_lib_cpp.git")
md5sums=('SKIP' 'SKIP' 'SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  if git describe --tags > /dev/null 2>&1;then
  git describe --tags --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/v//';
  else
  date +%Y%m%d;
  fi;
}
prepare(){
  cd "$srcdir/$pkgname/gui/qt"

  git submodule init
  git config submodule."core/debug/zdis".git.url $srcdir/zdis
  git config submodule."gui/qt/tivars_lib_cpp".git.url $srcdir/tivars_lib_cpp
  git submodule update
}
build() {
  cd "$srcdir/$pkgname/gui/qt"

  qmake -r CEmu.pro "PREFIX=$pkgdir/usr"
  make
}
package() {
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname/gui/qt/resources/linux/cemu.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname/gui/qt/resources/icons/linux/cemu-512x512.png" "$pkgdir/usr/share/pixmaps/cemu.png"

  cd "$srcdir/$pkgname/gui/qt"
  make install
}
