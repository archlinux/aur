# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=zypper-git
pkgver=1.14.18.2.g2106e0ef
pkgrel=1
pkgdesc="Command line software manager using libzypp"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/zypper"
license=('GPL')
depends=('libzypp-git' 'libxml2' 'procps' 'readline' 'augeas')
makedepends=('git' 'cmake' 'boost' 'asciidoc')
provides=('zypper' 'apt')
conflicts=('zypper' 'apt')
source=('git+https://github.com/openSUSE/zypper.git'
        'make-ZyppCommon-cmake-module-includable.patch')
md5sums=('SKIP'
         '526cf13a72658e7a3f2a07253eee07df')
_gitname="zypper"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed -r 's/-/./g')
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i $srcdir/make-ZyppCommon-cmake-module-includable.patch 
}

build() {
  cd "$srcdir/$_gitname"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D LIB=/lib \
    -D ZYPP_PREFIX=/usr \
    .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install

  # hacky sbin symlink fix
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
  rmdir $pkgdir/usr/sbin
}
