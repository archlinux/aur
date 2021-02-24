# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
# Contributor: Nikolay Korotkiy <sikmir@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Nick Østergaard <oe.nick@gmail.com>
# Contributor: Jonny Gerold <jonny@fsk141.com>
_pkgname=viking
pkgname=${_pkgname}-git
pkgver=1.8.r352.gc66ef1c6
pkgrel=1
pkgdesc='GTK+2 application to manage GPS data'
arch=(x86_64)
url='https://viking-gps.github.io/'
license=('GPL2')
depends=('curl' 'file' 'gpsd' 'gtk2' 'libgexiv2' 'mapnik' 'geoclue' 'liboauth' 'libzip')
makedepends=('git' 'boost' 'gtk-doc' 'intltool' 'yelp-tools')
optdepends=('gpsbabel: import and export GPS tracks from various formats')
options=('!emptydirs')
provides=("${pkgname//-git}=${pkgver}")
conflicts=($_pkgname)
source=("git+https://github.com/viking-gps/viking.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^viking\.//'
}

prepare() {
  cd "$_pkgname"

  export NOCONFIGURE=yes
  ./autogen.sh
}

build() {
  cd "$_pkgname"

  export CXXFLAGS="$CXXFLAGS -I/usr/include/mapnik"
  ./configure --prefix=/usr --enable-geocaches
  make
}

package(){
  cd "$_pkgname"

  make DESTDIR="${pkgdir}" install
}
