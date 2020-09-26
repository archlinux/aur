# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname='solvespace'
pkgname="${_pkgname}-git"
pkgver=r1574.0a061b6
pkgrel=1
pkgdesc='Parametric 2d/3d CAD'
arch=('x86_64')
url='https://solvespace.com'
license=('GPL3')
depends=('gtkmm3' 'libspnav')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/${_pkgname}/${_pkgname}.git")
sha256sums=('SKIP')

prepare() {
  cd "${_pkgname}"
  git submodule update --init 'extlib/flatbuffers' 'extlib/libdxfrw' 'extlib/mimalloc' 'extlib/q3d'
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C "build" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
