# Maintainer: ohli <olifriedrich at gmail dot com>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=w_scan_cpp
pkgver=20220105
pkgrel=2

# These are versions of dependencies used by w_scan_cpp
_wirbelscan_version=wirbelscan-2022.01.05
_satip_gitver=a89ad423e9a3994572d3bbbbf2958b470afa8de1
_vdr_gitver=d05765c670befc42e55b05a0fd75bb7771076c04

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
sha256sums=('d6acf3568f5743423579b8ab6f9184e231ba654edb2cdb2c6291531e79e7527e'
            '8559c74838e5105016b8c0cd506d3f8721933e2bbadd5b3617f465284f702e2e'
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

