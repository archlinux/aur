# Maintainer: Joshua Smith <smolsheep@opensuse.org>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Daan De Meye <daan.j.demeyer@gmail.com>
# Contributor: Silvio Knizek <knizek@b1-systems.de>

pkgname=zypper
pkgver=1.14.77
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
)
sha256sums=('1674a46da997dc5a366d8fcb02172dfd15242975eccd0068d083fbf4199474f4')

prepare() {
  cd "${pkgname}-${pkgver}"
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
