# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='nanonote'
pkgname="${_pkgname}-git"
pkgver=1.3.0.r0.g7230986
pkgrel=2
pkgdesc='Minimalist note taking application'
arch=('x86_64')
url='https://github.com/agateau/nanonote'
license=('BSD')
depends=('hicolor-icon-theme' 'qt5-base')
makedepends=('extra-cmake-modules' 'git' 'python-jinja' 'python-pyaml' 'qt5-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git"
        "git+${url%/*}/qpropgen.git"
        "git+https://github.com/itay-grudev/SingleApplication.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${_pkgname}"
  # Submodule list: https://github.com/agateau/nanonote/raw/master/.gitmodules
  git submodule init
  git config 'submodule.qpropgen.url' "${srcdir}/qpropgen"
  git config 'submodule.singleapplication.url' "${srcdir}/SingleApplication"
  git submodule update
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
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
