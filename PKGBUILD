# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=w_scan_cpp
pkgver=20230604
pkgrel=1

# These are versions of dependencies used by w_scan_cpp
_wirbelscan_version=wirbelscan-2023.06.04
_satip_gitver=7ef19f78c8cc0dfb2398be8f6577eadd4475fa51
_vdr_gitver=42b584e38d442cae587add3a1018d4ed6917e123

pkgdesc="A dtv channel scanner based on VDR. Successor of w_scan"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html"
license=('GPL')
depends=('freetype2' 'fontconfig' 'pugixml' 'librepfunc' 'libjpeg' 'curl')
makedepends=('git' 'pango')
source=("https://www.gen2vdr.de/wirbel/$pkgname/$pkgname-$pkgver.tar.bz2"
        "https://www.gen2vdr.de/wirbel/wirbelscan/vdr-${_wirbelscan_version}.tgz"
        "git://git.tvdr.de/vdr.git#commit=$_vdr_gitver"
        "git+https://github.com/wirbel-at-vdr-portal/vdr-plugin-satip.git#commit=$_satip_gitver"
       )
sha256sums=('f617e6a80e78d1514ef8413e8d6a4ca5bbacf1b74cb89f06e3b9a06e00a7e953'
            '22bfd788c280c7da27c7372c57440561d1577f745df52a8965599a912480fb74'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Copy VDR source into place
  cp -a "$srcdir/vdr" .
  rm -rf "vdr/.git"
  mkdir -p "vdr/PLUGINS/src"
  mkdir -p "vdr/PLUGINS/lib"

  # Copy plugin sources into place
  cp -a "$srcdir/vdr-plugin-satip" "vdr/PLUGINS/src"
  ln -s "vdr-plugin-satip" "vdr/PLUGINS/src/satip"
  cp -a "$srcdir/$_wirbelscan_version" "vdr/PLUGINS/src"
  ln -s "$_wirbelscan_version" "vdr/PLUGINS/src/wirbelscan"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

