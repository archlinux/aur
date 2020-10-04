# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sfxr-qt'
pkgname="${_pkgname}-git"
pkgver=1.3.0.r4.g052ca2b
pkgrel=1
pkgdesc='Qt port of SFXR, a sound effect generator, to generate retro-gaming like sound effects'
arch=('x86_64')
url='https://github.com/agateau/sfxr-qt'
license=('MIT')
depends=('hicolor-icon-theme' 'python-jinja' 'python-pyaml' 'qt5-declarative' 'sdl')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git"
        "git+https://github.com/catchorg/Catch2.git"
        "git+${url%/*}/qpropgen.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${_pkgname}"
  # Submodule list: https://github.com/agateau/nanonote/raw/master/.gitmodules
  git submodule init
  git config submodule.3rdparty/catch2.url "${srcdir}/Catch2"
  git config submodule.qpropgen.url "${srcdir}/qpropgen"
  git submodule update
}

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C build install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
