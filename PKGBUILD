# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=w_scan_cpp
pkgver=20260515
pkgrel=2

# These are versions of dependencies used by w_scan_cpp
_wirbelscan_version=2026.05.15
_satip_gitver=ca4104f2f3799fcf497e25e50db1e2807947ac53
_vdr_gitver=65ca01c6a0d73426c2c15d85df03ffde2a1bf931

pkgdesc="A dtv channel scanner based on VDR. Successor of w_scan"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html"
license=('GPL-1.0-or-later')
depends=('freetype2' 'fontconfig' 'pugixml' 'librepfunc' 'libjpeg-turbo' 'curl')
makedepends=('git' 'pango')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wirbel-at-vdr-portal/w_scan_cpp/archive/refs/tags/$pkgver.tar.gz"
  "vdr-wirbelscan-$_wirbelscan_version.tar.gz::https://github.com/wirbel-at-vdr-portal/wirbelscan-dev/archive/refs/tags/$_wirbelscan_version.tar.gz"
  "git://git.tvdr.de/vdr.git#commit=$_vdr_gitver"
  "vdr-plugin-satip-wirbel::git+https://github.com/wirbel-at-vdr-portal/vdr-plugin-satip.git#commit=$_satip_gitver"
)
sha256sums=('63a62aa9b793cd5d634886be4930abce367746b57181f62a74ec9546a6800352'
  '6e4bfb472999e4618b7d015943417024c27fb7baf0d1e11f44f5d9aef2c5495e'
  '11ec378a3bba5931c5415354d0c55dfd9089dad637db194aa4a845830a207c88'
  '3b51f4126c0f92b189e0fc5827d458aec562e2c6f47d02f19519e7921ae641df')

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
