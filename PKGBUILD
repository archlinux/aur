# Maintainer: Adam Wahab <awahab@adhoc.tools>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname='solvespace'
pkgname="${_pkgname}-git"
pkgver=r2194.3e5873e6
pkgrel=1
pkgdesc='Parametric 2D/3D CAD'
arch=('x86_64')
url='https://solvespace.com'
_url_source='https://github.com/solvespace/solvespace'
license=('GPL3')
depends=('gtkmm3' 'libspnav')
# omp.h is in the LLVM runtime package, the library is in gcc-libs
makedepends=('cmake' 'git' 'openmp')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${_url_source}.git")
sha256sums=('SKIP')

prepare() {
  cd "${_pkgname}"
  git submodule update --init --recursive
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B 'build' -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_OPENMP=ON \
    -Wno-dev
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
