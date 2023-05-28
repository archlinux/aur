#Maintainer: Matthias Mailänder <matthias at mailaender dot name>
#Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='sfxr-qt'
pkgver=1.5.0
pkgrel=1
pkgdesc='Qt port of SFXR, a sound effect generator, to generate retro-gaming like sound effects'
arch=('x86_64')
url='https://github.com/agateau/sfxr-qt'
license=('MIT')
depends=('hicolor-icon-theme' 'python-jinja' 'python-pyaml' 'qt5-base' 'qt5-declarative' 'sdl' 'catch2')
makedepends=('cmake' 'git')
source=("git+${url}.git#tag=${pkgver}"
        "git+${url%/*}/qpropgen.git"
        "https://patch-diff.githubusercontent.com/raw/agateau/sfxr-qt/pull/14.patch"
        "https://patch-diff.githubusercontent.com/raw/agateau/sfxr-qt/pull/16.patch")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${pkgname}"
  patch --forward --strip=1 --input="${srcdir}/14.patch"
  patch --forward --strip=1 --input="${srcdir}/16.patch"

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
