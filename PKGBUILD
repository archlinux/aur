# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Submitter: Spyhawk

_pkgname=libzypp
pkgname="${_pkgname}-git"
pkgver=17.24.1.r9.g52f82f322
pkgrel=1
pkgdesc='Library for package, patch, pattern and product management'
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp"
license=('GPL')
depends=(
  'boost-libs'
  'gpgme'
  'libproxy'
  'libsigc++'
  'libsolv'
  'libsystemd'
  'libxml2'
)
makedepends=(
  'asciidoc'
  'boost'
  'cmake'
  'dejagnu'
  'expat'
  'git'
  'gnupg'
  'graphviz'
  'ninja'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/openSUSE/${_pkgname}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # CMake doesn't find FindLibSolv.cmake in /usr/share/cmake/Modules
  cp /usr/share/cmake/Modules/FindLibSolv.cmake "${pkgname}"/cmake/modules/

  rm -rf build
}

build() {
  cmake \
    -B build \
    -S "${pkgname}" \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D LIB=lib \
    -D CMAKE_SKIP_RPATH=1 \
    -D DISABLE_LIBPROXY=0 \
    -D DISABLE_AUTODOCS=1 \
    -D DISABLE_MEDIABACKEND_TESTS=ON \

  ninja -C build
}

# check() {
#   ninja -C build test
# }

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  # cmake fix (see GH#28)
  mkdir -p "${pkgdir}"/usr/lib/cmake/Zypp
  mv "${pkgdir}"/usr/share/cmake/Modules/* "${pkgdir}"/usr/lib/cmake/Zypp/
  rm -rf "${pkgdir}"/usr/share/cmake
}
