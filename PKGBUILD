# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
set -u
_pkgname='uncrustify'
pkgname="${_pkgname}-git"
pkgver=0.78.1.r26.g391047527
pkgrel=1
pkgdesc='A source code beautifier'
arch=('i686' 'x86_64')
url="http://${_pkgname}.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_srcdir="${pkgname}-u"
source=("${_srcdir}::git+https://github.com/uncrustify/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe | sed -e 's/^uncrustify-//' -e 's/-/.r/' -e 's/-/./'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -d 'build' ]; then
    mkdir 'build'
    cd 'build'
    cmake -D'CMAKE_BUILD_TYPE=RelWithDebInfo' -D'CMAKE_INSTALL_PREFIX:PATH=/usr' ..
  else
    cd 'build'
  fi
  # nice cmake --build .
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -j "${_nproc}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}/build"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
