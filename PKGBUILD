# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinpearlhd
pkgver=0.0.2
_vdrapi=2.4.1
pkgrel=1
pkgdesc="conversion of the PearlHD-Skin written by mapovi to a native vdr-plugin"
url='https://github.com/vdr-projects/vdr-plugin-skinpearlhd'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-skinpearlhd/archive/refs/tags/$pkgver.tar.gz"
        'pearlhd-use_graphicsmagick.diff'
        'skinpearlhd-search_for_logos_in_resourcedir.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('912f3f962f07bfd7571c1dab0dc8f83c9e48736a372af053cacd00b467a225de'
            '8f402f0623876731e912784bdcd8a7c9e62418407f9fa186aef5d402e81956a5'
            '8094206e7335d84ad1e4b1e2b2a98455c98ea6d247ae3a51a58c309e4f4efbdc'
            'd5de43f05b850d5db2d06b543840bb22b7981f4b47e1318cc57e533737dc6225')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"

  # Use GraphicsMagick instead of ImageMagick
  patch -p1 -i "$srcdir/pearlhd-use_graphicsmagick.diff"

  patch -p1 -i "$srcdir/skinpearlhd-search_for_logos_in_resourcedir.diff"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
