# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-remoteosd
pkgver=1.0.0
_vdrapi=2.4.0
pkgrel=15
pkgdesc="Display the menu of a remote VDR as submenu item of your local VDR menu"
url="http://vdr.schmirler.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}" 'vdr-svdrpservice')
_plugname=${pkgname//vdr-/}
source=("http://vdr.schmirler.de/$_plugname/$pkgname-$pkgver.tgz"
        "vdr-remoteosd-1.0.0-vdr-2.3.2.diff::https://www.vdr-portal.de/index.php?attachment/40530")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('5ec2756944cdb36808d1332e7e6a87c8'
         'c6af05b7090f0b1153d44dbabb674dcc')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
    if [ `vercmp $_vdrapi 2.3.0` -eq 1 ]; then
      patch -p1 -i "$srcdir/vdr-remoteosd-1.0.0-vdr-2.3.2.diff"
    fi
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
