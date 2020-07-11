# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

_pkgname=klavaro
pkgname=${_pkgname}-svn
pkgver=3.10.r118M
pkgrel=1
pkgdesc='Flexible touch typing tutor that supports customizable keyboard layouts'
arch=('x86_64')
url='https://klavaro.sourceforge.io'
license=('GPL3')
depends=('gtk3')
makedepends=('clang' 'intltool' 'subversion')
optdepends=('espeakup: voice output')
provides=("${_pkgname}")
source=("${_pkgname}::svn+https://svn.code.sf.net/p/${_pkgname}/code/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "$(grep -Pm1 '[\d.]+' NEWS | cut -d' ' -f2).r$(svnversion)"
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

check() {
  make -C "${_pkgname}" check
}

package() {
  make DESTDIR="${pkgdir}" -C "${_pkgname}" install
  install -Dm644 "${_pkgname}/README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  sed -i 's|/usr/share/icons/hicolor/24x24/apps/klavaro.png|klavaro|' \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim: ts=2 sw=2 et:
