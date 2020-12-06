# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='crazy'
_pkgname='crazydiskinfo'
pkgname="${_pkgname}-git"
pkgver=1.1.0.r0.g803a585
pkgrel=1
pkgdesc='Interactive TUI S.M.A.R.T viewer'
arch=('x86_64')
url='https://github.com/otakuto/crazydiskinfo'
license=('MIT')
depends=('libatasmart')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  sed -i 's/tinfow/tinfo/g' "${_pkgname}/CMakeLists.txt"
  sed -i 's/ncursesw/ncurses/g' "${_pkgname}/CMakeLists.txt"
}

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B 'build' -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C 'build'
}

package() {
  install -Dvm755 "build/${_name}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
