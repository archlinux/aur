# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=zypper
pkgver=1.14.17
pkgrel=1
pkgdesc="Command line software manager using libzypp"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/zypper"
license=('GPL')
depends=('libzypp' 'libxml2' 'procps' 'readline' 'augeas')
makedepends=('git' 'cmake' 'boost' 'asciidoc')
provides=('zypper' 'apt')
conflicts=('apt')
source=("https://github.com/openSUSE/zypper/archive/${pkgver}.tar.gz"
        'make-ZyppCommon-cmake-module-includable.patch')
sha256sums=('9a1f74b4700e5bc547c22eb9351fb09017f9153ce987084f4664bface096e844'
            'f5cdd85109c58d786f1124fa3cab1c5431a93a8d87a59117eac257c6e4698ae7')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i $srcdir/make-ZyppCommon-cmake-module-includable.patch 
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D LIB=/lib \
    -D ZYPP_PREFIX=/usr \
    .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  # hacky sbin symlink fix
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
  rmdir $pkgdir/usr/sbin
}
