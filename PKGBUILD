# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Alexander Grothe <seahawk1986[at]hotmail[dot]com>
pkgname=vdr-filebrowser
pkgver=0.2.1
_vdrapi=2.4.3
pkgrel=21
pkgdesc="filebrowser with custom commands for vdr"
url="http://opensource.holgerbrunn.net/vdr/filebrowser/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
replaces=("vdr-plugin-$_plugname")
conflicts=("vdr-plugin-$_plugname")
source=("http://opensource.holgerbrunn.net/vdr/filebrowser/$pkgname-$pkgver.tgz"
        "$pkgname-new-makefile.patch")
backup=("var/lib/vdr/plugins/filebrowser/commands.conf"
        "var/lib/vdr/plugins/filebrowser/order.conf"
        "var/lib/vdr/plugins/filebrowser/othercommands.conf"
        "var/lib/vdr/plugins/filebrowser/sources.conf"
        "etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('a1813fec39604b62c38c3ab44fe4aa5f'
         'd4a9a9442645c1168b0ed58021958c73')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/$pkgname-new-makefile.patch"
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/var/lib/vdr/plugins/filebrowser"
  install -m644 examples/filebrowser/*  "$pkgdir/var/lib/vdr/plugins/filebrowser"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
