# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Nick Black <dankamongmen@gmail.com>

pkgname=notcurses-nodocs-git
pkgver=2.2.3
pkgrel=1
pkgdesc="Blingful TUI/character graphics library"
url="https://nick-black.com/dankwiki/index.php/Notcurses"
license=('Apache')
arch=('x86_64')
# qrcodegen is currently shipped as a static archive on Arch, rather than a
# dynamic library. Should the .so be shipped in the future, promote qrcodegen
# from a makedepends to a true depends, and use that dynamic library.
depends=('ncurses' 'ffmpeg' 'libunistring')
makedepends=('cmake' 'python-cffi' 'python-setuptools' 'readline' 'ninja')
optdepends=('qrcodegen: QR code support')
provides=(notcurses)
conflicts=(notcurses)
source=(git+https://github.com/dankamongmen/notcurses)

pkgver() {
  cd notcurses/build
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p notcurses/build
  cd notcurses/build
  cmake .. -GNinja -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DUSE_DOCTEST=OFF -DUSE_DOXYGEN=OFF -DUSE_PANDOC=OFF -DUSE_QRCODEGEN=OFF
}

build() {
  cd notcurses/build
  ninja $NINJAFLAGS
}

#check() {
#  cd notcurses/build
#  ninja $NINJAFLAGS test
#}

package() {
  cd notcurses/build
  DESTDIR="$pkgdir" ninja $NINJAFLAGS install
  cd ../cffi
  env CFLAGS="-I$pkgdir/usr/include -L../build" python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('SKIP')
