# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-bgprocess
pkgver=0.1.0
_vdrapi=2.4.0
pkgrel=22
pkgdesc="Displays information about background processes"
url="http://projects.vdr-developer.org/projects/plg-undelete"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://ftp.uni-kl.de/pub/linux/gentoo/distfiles/$pkgname-$pkgver.tgz"
        'bgprocess-tlphrases-fix.diff'
        'bgprocess-osditem-fix.diff')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('46bc8626cf843110eedef74d2dc27c3d'
         'd2f7efb1ab40727298d4d17e1b07e37c'
         '1556e199ab90264a1f45838abbef0243')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"

  patch -p1 -i ${srcdir}/bgprocess-tlphrases-fix.diff #By Holger Schvestka (yaVDR)
  patch -p1 -i ${srcdir}/bgprocess-osditem-fix.diff #By Holger Schestka (yaVDR)
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
