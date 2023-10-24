# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=w_scan_cpp
pkgver=20231015
pkgrel=1

# These are versions of dependencies used by w_scan_cpp
_wirbelscan_version=2023.10.15
_satip_gitver=65ee6589445dc0958acb2f4f4e0501c91875fdef
_vdr_gitver=5f136032a2cf9ce979c3ec81556a9c3164820baf

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
sha256sums=('5a68eb2340a478f3cbd5d064ede0eba06593c4349aa924d04b70579de4080c45'
            '5079bc93cd09edab2dc2f077d70af42c13306c688d52365b1e7c0e1781771596'
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

