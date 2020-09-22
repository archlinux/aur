# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Silvio Knizek <knizek@b1-systems.de>

pkgname=zypper
pkgver=1.14.36
pkgrel=1
pkgdesc="Command line software manager using libzypp"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/zypper"
license=('GPL')
depends=('libzypp' 'libxml2' 'procps' 'readline' 'augeas')
makedepends=('git' 'cmake' 'ninja' 'boost' 'asciidoc' 'asciidoctor')
provides=('zypper' 'apt')
conflicts=('apt')
source=("https://github.com/openSUSE/zypper/archive/${pkgver}.tar.gz"
        'make-ZyppCommon-cmake-module-includable.patch')
sha256sums=('a50e6e4aa8dea822cbc3eb5c47815a864e4f95dc404728ef21639439fe4317ea'
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
