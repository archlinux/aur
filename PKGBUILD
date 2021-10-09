# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

_pkgname='klavaro'
pkgname="${_pkgname}-svn"
pkgver=3.12.r137
pkgrel=1
pkgdesc='Flexible touch typing tutor that supports customizable keyboard layouts'
arch=('x86_64')
url='https://klavaro.sourceforge.io'
license=('GPL3')
depends=('gtkdatabox')
makedepends=('clang' 'intltool' 'python' 'subversion')
optdepends=('espeakup: voice output')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::svn+https://svn.code.sf.net/p/${_pkgname}/code/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local revision="$(svnversion)"
  printf "%s.r%s" "$(grep -Pom1 '^Version \K[\d.]+' 'NEWS')" "${revision//[[:alpha:]]}"
}

build() {
  cd "${_pkgname}"
  export CXX=clang++
  export CC=clang
  autoreconf --install
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" -C "${_pkgname}" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README"
}

# vim: ts=2 sw=2 et:
