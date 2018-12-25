# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-systeminfo
pkgver=0.1.4
_vdrapi=2.4.0
pkgrel=2
pkgdesc="displays system informations like CPU type and speed, disk and swap space etc."
url="http://firefly.vdr-developer.org/systeminfo/index.html"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('iproute2' 'lm_sensors' 'hddtemp' "vdr-api=${_vdrapi}")
#install="$pkgname.install"
_plugname=${pkgname//vdr-/}
source=("http://firefly.vdr-developer.org/systeminfo/${pkgname}-${pkgver}.tar.bz2"
        'systeminfo.sh'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "usr/lib/vdr/bin/$_plugname.sh")
md5sums=('6bf8a7d9def1d16b0819c755f507e9cd'
         'ea31a11d19b78f30f389793ebc34c3cb'
         '62018cc3ec0c08c596255821d9e7163e')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  sed -i 's/usr\/local/usr\/lib\/vdr/g' systeminfo.c
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm755 ${srcdir}/systeminfo.sh "$pkgdir/usr/lib/vdr/bin/systeminfo.sh"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
