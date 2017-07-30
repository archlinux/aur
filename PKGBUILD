_username=vorot93
_reponame=rstd
_pkgbase=rstd
pkgname=${_pkgbase}-git
pkgdesc="Rust standard library implemented in C++."
pkgver=r35.dc9a481
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/$_username/${_reponame/}"
provides=('rstd')
makedepends=('meson')
depends=('glibmm' 'boost')
license=('MIT')
options=('!staticlibs')
source=("git+https://github.com/${_username}/${_reponame}${_ref}")
sha256sums=('SKIP')

pkgver() {
  cd "${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  if [ -d ${srcdir}/build ]; then
    cd ${srcdir}/build
    if ! mesonconf; then
      cd ${srcdir}
      rm -rf ${srcdir}/build
    fi
  fi

  if [ ! -d ${srcdir}/build ]; then
    cd ${srcdir}/${_reponame}
    meson --prefix=/usr --buildtype=release ${srcdir}/build
    cd ..
  fi

  cd ${srcdir}/build
}

package() {
  cd ${srcdir}/build

  DESTDIR="${pkgdir}" ninja install
}
