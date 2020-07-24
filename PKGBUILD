# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=hdrmerge-git
pkgver=nightly.r70.gcb42a8b
pkgrel=1
pkgdesc='HDRMerge fuses two or more raw images into a single raw with an extended dynamic range.'
arch=('i686' 'x86_64')
url='http://jcelaya.github.io/hdrmerge/'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libraw' 'exiv2' 'zlib' 'alglib' 'boost-libs')
provides=('hdrmerge')
conflicts=('hdrmerge')

_gitroot='https://github.com/jcelaya/hdrmerge.git'
_gitname='hdrmerge'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  cmake CMakeLists.txt -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" XDG_UTILS_INSTALL_MODE=system install

  install -m 0644 -D hdrmerge.desktop $pkgdir/usr/share/applications/hdrmerge.desktop
  install -m 0644 -D data/images/icon.png $pkgdir/usr/share/icons/hicolor/128x128/apps/hdrmerge-icon.png
}
