# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=w_scan_cpp
pkgver=20230604
pkgrel=1

# These are versions of dependencies used by w_scan_cpp
_wirbelscan_version=2023.06.04
_satip_gitver=7ef19f78c8cc0dfb2398be8f6577eadd4475fa51
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
sha256sums=('d61e81895e6b87bf41a554103e9c93feb573f36a2649d24e0e9b8577e7736ead'
            'f58208ec8bb9eb868e50b5e2031f125d4d16aad625b812327c07d4de88371804'
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

