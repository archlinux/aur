# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=zypper
pkgver=1.14.18
pkgrel=3
pkgdesc="Command line software manager using libzypp"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/zypper"
license=('GPL')
depends=('libzypp' 'libxml2' 'procps' 'readline' 'augeas')
makedepends=('git' 'cmake' 'ninja' 'boost' 'asciidoc')
provides=('zypper' 'apt')
conflicts=('apt')
source=("https://github.com/openSUSE/zypper/archive/${pkgver}.tar.gz"
        'make-ZyppCommon-cmake-module-includable.patch')
sha256sums=('feb3ac9572ac40e456cecee34cdb69a70236c0242f23b9498d3f68326eacb624'
            'f5cdd85109c58d786f1124fa3cab1c5431a93a8d87a59117eac257c6e4698ae7')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i ../make-ZyppCommon-cmake-module-includable.patch 
}

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build && cd build
  cmake \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D LIB=/lib \
    -D ZYPP_PREFIX=/usr \
    ..
  ninja
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}/" ninja install

  # hacky sbin symlink fix
  mv "${pkgdir}"/usr/sbin/* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/usr/sbin"
}
