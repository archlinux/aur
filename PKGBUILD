# Maintainer: Aetf <7437103@gmail.com>
pkgname=libtsm-patched-git
_gitname=libtsm
pkgver=3.r17.gb73acb4
pkgrel=3
pkgdesc="Terminal-emulator State Machine. Patched flavor (using patches from http://github.com/Aetf/libtsm)"
arch=('i686' 'x86_64')
url="http://www.fredesktop.org/wiki/Software/kmscon/$_gitname"
license=('MIT')
depends=(glibc)
makedepends=('git' 'libxkbcommon')
provides=('libtsm-patched' 'libtsm')
conflicts=('libtsm' 'libtsm-patched')
options=(!libtool)
source=('git://people.freedesktop.org/~dvdhrm/libtsm'
        'addon-underline.patch'
        'addon-soft-black.patch'
        'addon-true-color.patch')
sha256sums=('SKIP'
            '7103869ea6d8b7151d1b6b0fa0852b66da10e3a59454e4d761cb9e6ddfef6958'
            '0d1635f90bd95915665e87e46fa4f3abd8ed3dfe193851d2598ba8b6d37e4e3e'
            '25f43bc1021cca1bbdab505938e6ca8f64675dc3014c24e0210a90f2524e1858')

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r "s/^$_gitname-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

build() {
  cd "$srcdir/$_gitname"
  echo 'Apply patch addon-underline.patch'
  patch -p1 -i ../addon-underline.patch
  echo 'Apply patch addon-soft-black.patch'
  patch -p1 -i ../addon-soft-black.patch
  echo 'Apply patch addon-true-color.patch'
  patch -p1 -i ../addon-true-color.patch

  test -f ./configure || NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
