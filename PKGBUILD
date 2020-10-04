# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='nanonote'
pkgver=1.3.0
pkgrel=2
pkgdesc='Minimalist note taking application '
arch=('x86_64')
url='https://github.com/agateau/nanonote'
license=('BSD')
depends=('hicolor-icon-theme' 'qt5-base')
makedepends=('cmake' 'git' 'python-jinja' 'python-pyaml')
source=("git+${url}.git#tag=${pkgver}"
        "git+${url%/*}/qpropgen.git"
        "git+https://github.com/itay-grudev/SingleApplication.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.qpropgen.url "${srcdir}/qpropgen"
  git config submodule.singleapplication.url "${srcdir}/SingleApplication"
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
