# Maintainer: Blair Bonnett <blair.bonnett at gmail>
# Contributor: David Phillips <dbphillipsnz at gmail> (brewtarget PKGBUILD)
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget PKGBUILD)
# Contributor: Michael Straube <straubem@gmx.de> (previous brewtarget-git package)

_pkgname=brewtarget
pkgname=brewtarget-git
pkgver=2.3.1.r928.gff96feba
pkgrel=1
pkgdesc="Brewing recipe designer and calculator"
url="http://www.brewtarget.org/"
arch=('x86_64')
license=('GPL3' 'custom:WTFPL-2')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-webkit' 'qt5-svg' 'xerces-c' 'xalan-c')
optdepends=(
  'postgresql-libs: PostgreSQL database support'
)
makedepends=('cmake' 'git' 'boost')
checkdepends=('xorg-server-xvfb')
conflicts=(brewtarget)
provides=(brewtarget)
backup=()
source=(
  'git+https://github.com/Brewtarget/brewtarget.git'
  'prevent_srcdir_references.patch'
)
sha256sums=(
  'SKIP'
  'f32aaaf2036dff8ce75329a3e166a70999ae17bd770c29ab07fa635f2297ec24'
)

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -p0 -i "$srcdir/prevent_srcdir_references.patch"
}

build() {
  mkdir -p "${_pkgname}-build"
  cd "${_pkgname}-build"
  cmake "../${_pkgname}" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd "${_pkgname}-build"
  export QT_QPA_PLATFORM=offscreen
  ctest --output-on-failure
  unset -v QT_QPA_PLATFORM
}

package() {
  cd "${_pkgname}-build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../${_pkgname}/COPYING.WTFPL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.WTFPL"
}
