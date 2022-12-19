# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinenigmang
pkgver=0.1.4
pkgrel=2
_vdrapi=2.6.3
epoch=1
pkgdesc="skin based on the Enigma text2skin addon"
url="https://github.com/vdr-projects/vdr-plugin-skinenigmang"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('freetype2' 'gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-skinenigmang/archive/refs/tags/$pkgver.tar.gz"
        'skinenigmang-search_for_logos_in_resourcedir.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('853f4b47b2b2e688ec0062695f7261962c734fa894b3db4e69266986c0e20a4e'
            'e61d17e978a01988118737f7f0c0af6aba7999c1f465940c8e1529d0bf49c6fc'
            '134aba4b0c41beeecec0eb7f5014d58bd02a2546106474f8dd76fab26abf86b4')

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  patch -p1 -i "$srcdir/skinenigmang-search_for_logos_in_resourcedir.diff"
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  mkdir -p "$pkgdir/var/lib/vdr/themes"
  cp themes/* "$pkgdir/var/lib/vdr/themes"
  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
