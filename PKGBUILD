# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-remoteosd
pkgver=1.0.0
_vdrapi=2.4.3
pkgrel=18
pkgdesc="Display the menu of a remote VDR as submenu item of your local VDR menu"
url="http://vdr.schmirler.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}" 'vdr-svdrpservice')
_plugname=${pkgname//vdr-/}
source=("http://vdr.schmirler.de/$_plugname/$pkgname-$pkgver.tgz"
        "$pkgname-vdr-2.3.2.patch"
        "$pkgname-serverip.patch")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('12b7d74b37917dca616842ec36998cd737594b65bbe711e48e5fc5d48210f46c'
            'c8307d9d29d4dec41ed0d9e1ad335be6e6be997e9bf3503903f2b3ccd5ce73a8'
            '8d84f9f7e4f984a27dc82fee05e8806713476fd73d0f68f9582aed06e1ac650d')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/$pkgname-vdr-2.3.2.patch"
  patch -p1 -i "$srcdir/$pkgname-serverip.patch"
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
