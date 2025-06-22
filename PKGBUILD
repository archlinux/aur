# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=w_scan_cpp
pkgver=20250615
pkgrel=1

# These are versions of dependencies used by w_scan_cpp
_wirbelscan_version=2024.09.15
_satip_gitver=18b4cc1d4442251f7b6f0e9911af492d1556a399
_vdr_gitver=591085812def02a827624a4cffc2cc3a2b984f8e

pkgdesc="A dtv channel scanner based on VDR. Successor of w_scan"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html"
license=('GPL')
depends=('freetype2' 'fontconfig' 'pugixml' 'librepfunc' 'libjpeg' 'curl')
makedepends=('git' 'pango')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wirbel-at-vdr-portal/w_scan_cpp/archive/refs/tags/$pkgver.tar.gz"
        "vdr-wirbelscan-$_wirbelscan_version.tar.gz::https://github.com/wirbel-at-vdr-portal/wirbelscan-dev/archive/refs/tags/$_wirbelscan_version.tar.gz"
        "git://git.tvdr.de/vdr.git#commit=$_vdr_gitver"
        "vdr-plugin-satip-wirbel::git+https://github.com/wirbel-at-vdr-portal/vdr-plugin-satip.git#commit=$_satip_gitver"
       )
sha256sums=('e8c1134f5f80d74c15b74624aa653aa41f1fbc9fec2c676e1d90a8e2ba46d91d'
            '5f56dfdb64029c4efbee391eb7cdb45ad308f78e3b9078d0756d0fbf1dbdeb6c'
            '58c8becb877e143ed1887eac2e8bab70dd9f447cccfd298b5389ac4b6745595c'
            '96cffd30738d8986cec521430a03f9970c61471b38fc0c962bafd94a306f5f17')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Copy VDR source into place
  cp -a "$srcdir/vdr" .
  rm -rf "vdr/.git"
  mkdir -p "vdr/PLUGINS/src"
  mkdir -p "vdr/PLUGINS/lib"

  # Copy plugin sources into place
  cp -a "$srcdir/vdr-plugin-satip-wirbel" "vdr/PLUGINS/src"
  ln -s "vdr-plugin-satip-wirbel" "vdr/PLUGINS/src/satip"
  cp -a "$srcdir/wirbelscan-dev-$_wirbelscan_version" "vdr/PLUGINS/src"
  ln -s "wirbelscan-dev-$_wirbelscan_version" "vdr/PLUGINS/src/wirbelscan"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

