# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=w_scan_cpp
pkgver=20230121
pkgrel=1

# These are versions of dependencies used by w_scan_cpp
_wirbelscan_version=wirbelscan-2023.01.21
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
        "vdr-wirbelscan-add_missing_cstdint_h.patch::https://github.com/wirbel-at-vdr-portal/wirbelscan-dev/commit/016c9aee9d12326e3b08ded15ab98ab5c82c7228.patch"
       )
sha256sums=('6177dc8a42f87c03292de74bfe43bf4c0f027727e017c0d98f211666d9bed4bf'
            'd6db38e259699de21a4c261ed1799991539fe57dea987870854e037b9c0be7f9'
            'SKIP'
            'SKIP'
            'b4dde703cb0c091a0646d85b6a82b58b580989f5bfcf9ac797b183f4654c548b')

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

  cd "$srcdir/$pkgname-$pkgver/vdr/PLUGINS/src/wirbelscan"
  sed '/diff --git a\/HISTORY/,/diff --git/d' "$srcdir/vdr-wirbelscan-add_missing_cstdint_h.patch" | patch -p1
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

