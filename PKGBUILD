#Maintainer: Matthias Mailänder <matthias at mailaender dot name>
#Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='sfxr-qt'
pkgver=1.5.1
pkgrel=2
pkgdesc='Qt port of SFXR, a sound effect generator, to generate retro-gaming like sound effects'
arch=('x86_64')
url='https://github.com/agateau/sfxr-qt'
license=('MIT')
depends=('hicolor-icon-theme' 'python-jinja' 'python-pyaml' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'sdl' 'catch2')
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("git+${url}.git#tag=${pkgver}"
        "git+${url%/*}/qpropgen.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "${pkgname}"

  # Submodule list: https://github.com/agateau/sfxr-qt/raw/master/.gitmodules
  git submodule init
  git config submodule.qpropgen.url "${srcdir}/qpropgen"
  git -c protocol.file.allow=always submodule update
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_SYSTEM_CATCH2=ON \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C build install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
