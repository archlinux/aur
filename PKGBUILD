# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-bgprocess
pkgver=0.1.0
_vdrapi=2.4.6
pkgrel=26
pkgdesc="Displays information about background processes"
url="http://www.vdr-wiki.de/wiki/index.php/Bgprocess-plugin"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://ftp.uni-kl.de/pub/linux/gentoo/distfiles/$pkgname-$pkgver.tgz"
        "$pkgname-01_locale.patch"
        "$pkgname-03_tlphrases.patch"
        "$pkgname-04_osditem.patch")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('79612020bda0cf59265ceea9898a3a73179ee8caed44fbb9b259d0e52f7fa91f'
            'c5e6260d26a169d8d37dc9226b79b6e00806ad5ebda5227f1466f243f9d940a6'
            '344622c47c7e995b19431fb14bb2ca986a1635ed4b0522a814771e53d9c52590'
            '9305299e91a0ba3b655fe5c452f2d36fc36a211fa67a3101313cc6e3241e5d90')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"

  patch -p1 -i "${srcdir}/$pkgname-01_locale.patch"
  patch -p1 -i "${srcdir}/$pkgname-03_tlphrases.patch" #By Holger Schvestka (yaVDR)
  patch -p1 -i "${srcdir}/$pkgname-04_osditem.patch" #By Holger Schestka (yaVDR)
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make CFLAGS="$(pkg-config vdr --variable=cflags)" \
       CXXFLAGS="$(pkg-config vdr --variable=cxxflags)" \
       VDRDIR="/usr/include/vdr" \
       LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
       LOCALEDIR="$pkgdir/$(pkg-config vdr --variable=locdir)" \
       VDRLOCALE=1 \
       all

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
