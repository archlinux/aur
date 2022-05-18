# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Daan De Meye <daan.j.demeyer@gmail.com>
# Contributor: Silvio Knizek <knizek@b1-systems.de>

pkgname=zypper
pkgver=1.14.52
pkgrel=1
pkgdesc="World's most powerful command line package manager"
arch=('x86_64')
url='http://en.opensuse.org/Portal:Zypper'
license=('GPL')
depends=(
  'augeas'
  'libzypp'
  'perl'
  'procps'
)
makedepends=(
  'asciidoc'
  'asciidoctor'
  'boost'
  'cmake'
)
provides=('apt')
conflicts=('apt')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/zypper/archive/${pkgver}.tar.gz"
  'make-ZyppCommon-cmake-module-includable.patch'
)
sha256sums=('8975f6009950835b750d4d50a21f2bdb53f46f0dc5440cb59b57c745f7317a05'
            'f5cdd85109c58d786f1124fa3cab1c5431a93a8d87a59117eac257c6e4698ae7')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i ../make-ZyppCommon-cmake-module-includable.patch 
}

build() {
  cmake \
    -B build \
    -S "${pkgname}-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D LIB=lib \
    -D ZYPP_PREFIX=/usr \
    -D ENABLE_BUILD_TESTS=ON

  cmake --build build
}

check() {
  ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # hacky sbin symlink fix
  mv "${pkgdir}"/usr/sbin/* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/usr/sbin"
}
