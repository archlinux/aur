# Maintainer: Christopher Reimer <vdr4arch[at]creimer[dot]net>
pkgname=vdr-sc
pkgver=20120721
_hgver=29b7b5f2
_vdrapi=2.1.6
pkgrel=12
pkgdesc="Software CAM emulation"
url="http://207.44.152.197/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libdvbcsa' 'openssl' "vdr-api=${_vdrapi}")
makedepends=('mercurial')
_plugname=$(echo $pkgname | sed 's/vdr-//g')
source=("$pkgname::hg+http://85.17.209.13:6100#revision=$_hgver"
        "ftp://ftp.tvdr.de/vdr/Developer/vdr-$_vdrapi.tar.bz2"
        'http://data.gpo.zugaina.org/vdr-devel/media-plugins/vdr-sc/files/vdr-sc-0.9.3.20120815_vdr-2.1.4_compilefix.diff'
        'Add_libdvbcsa_support.diff'
        "20-$_plugname.conf")
backup=("etc/vdr/conf.avail/20-$_plugname.conf")
md5sums=('SKIP'
         '79519dac59166fabc2029b916bd61d00'
         '529bc4056e2be62904f676780ea2fbc8'
         'b00108754f574c0773d30e288b703045'
         '397dfba03003ba28c5f95d0855497d78')

pkgver() {
  cd "$srcdir/$pkgname"
  hg log -l1 --template "{shortdate(date)}" | sed 's/-//g'
}

prepare() {
  cd "$srcdir/$pkgname"

  patch -p1 -i "$srcdir/Add_libdvbcsa_support.diff"
  patch -p1 -i "$srcdir/vdr-sc-0.9.3.20120815_vdr-2.1.4_compilefix.diff"

  #Disable Keyfile support. If you want to watch paytv, pay for it.
#  ( cd systems
#    ls | grep -v cardclient | xargs rm -r )

  sed -i 's/MAXDVBDEVICES/MAXDEVICES/g' device.c

  ln -sfr "$srcdir/vdr-$_vdrapi/PLUGINS/src/dvbhddevice" "$srcdir"
  ln -sfr "$srcdir/vdr-$_vdrapi/PLUGINS/src/dvbsddevice" "$srcdir"
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make CFLAGS="$(pkg-config vdr --variable=cflags)" \
       CXXFLAGS="$(pkg-config vdr --variable=cxxflags)" \
       VDRDIR="/usr" \
       LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
       LOCALEDIR="$pkgdir/$(pkg-config vdr --variable=locdir)" \
       MAXCAID=64 \
       LIBDVBCSA=1 \
       i18n systems libsc-dvbhddevice.so libsc-dvbsddevice.so libvdr-$_plugname.so
  install -Dm755 libsc-dvbhddevice.so "$pkgdir/usr/lib/vdr/plugins/libsc-dvbhddevice.so.$_vdrapi"
  install -Dm755 libsc-dvbsddevice.so "$pkgdir/usr/lib/vdr/plugins/libsc-dvbsddevice.so.$_vdrapi"
  install -Dm755 libvdr-$_plugname.so "$pkgdir/usr/lib/vdr/plugins/libvdr-$_plugname.so.$_vdrapi"

  install -Dm644 "$srcdir/20-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/20-$_plugname.conf"
}
