# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='sfxr-qt'
pkgver=1.3.0
pkgrel=1
pkgdesc='Qt port of SFXR, a sound effect generator, to generate retro-gaming like sound effects'
arch=('x86_64')
url='https://github.com/agateau/sfxr-qt'
license=('MIT')
depends=('hicolor-icon-theme' 'python-jinja' 'python-pyaml' 'qt5-base' 'qt5-declarative' 'sdl')
makedepends=('cmake' 'git')
source=("git+${url}.git#tag=${pkgver}"
        "git+https://github.com/catchorg/Catch2.git"
        "git+${url%/*}/qpropgen.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${pkgname}"
  # Submodule list: https://github.com/agateau/sfxr-qt/raw/master/.gitmodules
  git submodule init
  git config submodule.3rdparty/catch2.url "${srcdir}/Catch2"
  git config submodule.qpropgen.url "${srcdir}/qpropgen"
  git submodule update
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C build install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
