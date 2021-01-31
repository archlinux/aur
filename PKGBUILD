# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Alexander Grothe <seahawk1986[at]hotmail[dot]com>
pkgname=vdr-filebrowser
pkgver=0.2.2
_vdrapi=2.4.6
pkgrel=1
pkgdesc="filebrowser with custom commands for vdr"
url="https://github.com/vdr-projects/vdr-plugin-filebrowser"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
replaces=("vdr-plugin-$_plugname")
conflicts=("vdr-plugin-$_plugname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-filebrowser/archive/$pkgver.tar.gz")
backup=("var/lib/vdr/plugins/filebrowser/commands.conf"
        "var/lib/vdr/plugins/filebrowser/order.conf"
        "var/lib/vdr/plugins/filebrowser/othercommands.conf"
        "var/lib/vdr/plugins/filebrowser/sources.conf"
        "etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('9596c65b1d9c3745eab04b9fb3e37dad4fe778db25f7bafe0c2e50cf348a8335')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/var/lib/vdr/plugins/filebrowser"
  install -m644 examples/filebrowser/*  "$pkgdir/var/lib/vdr/plugins/filebrowser"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
