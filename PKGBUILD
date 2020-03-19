# Maintainer: Aetf <aetf at unlimitedcodeworks dor xyz>
pkgname=libtsm-patched-git
_gitname=libtsm
pkgver=4.0.1.r3.g8d299ab
pkgrel=1
pkgdesc="Terminal-emulator State Machine. Patched flavor (using patches from http://github.com/Aetf/libtsm)"
arch=('x86_64' 'armv7h')
url="http://www.freedesktop.org/wiki/Software/kmscon/$_gitname"
license=('MIT')
depends=(glibc)
makedepends=('cmake' 'git' 'libxkbcommon')
provides=('libtsm-patched' 'libtsm')
conflicts=('libtsm' 'libtsm-patched')
options=(!libtool)
source=('git+https://github.com/Aetf/libtsm.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r "s/^$_gitname-//;s/^v//;s/([^-]*-g)/r\\1/;s/-/./g"
}

prepare() {
  cd "$srcdir/$_gitname"

  mkdir -p build && cd build

  cmake \
    -DBUILD_TESTING=OFF \
    -DBUILD_GTKTSM=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..
}

build() {
  cd "$srcdir/$_gitname/build"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"

  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
