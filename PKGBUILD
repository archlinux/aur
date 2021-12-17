# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=w_scan_cpp
pkgver=20211212
pkgrel=1

# These are versions of dependencies used by w_scan_cpp
_wirbelscan_version=wirbelscan-2021.12.11
_satip_gitver=a89ad423e9a3994572d3bbbbf2958b470afa8de1
_vdr_gitver=0d50ec57f50375c8fda92d117e348dd8fd5a77a9

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
sha256sums=('7f409f7fb6bd991276bc5fa672a8613cd7b03fc07154c231d847e3667dcbb7e7'
            '51c6edabd49ce9581bce3747d48bbd123c026ab3cddc0d450d071c0ee5ab7078'
            'SKIP'
            'SKIP')

prepare() {
  cd "$pkgname-$pkgver"

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
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

