# Maintainer: Christopher Reimer <vdr4arch[at]creimer[dot]net>
pkgname=vdr-sc
pkgver=r9.75b4379
_vdrapi=2.4.0
_gitver=75b4379e4fa3f6fa1f6908591be8e9bbb44dd990
pkgrel=1
pkgdesc="Software CAM emulation"
url="http://207.44.152.197/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libdvbcsa' 'openssl' "vdr>=2.4.0" "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=$(echo $pkgname | sed 's/vdr-//g')
source=(#"$pkgname::hg+http://85.17.209.13:6100#revision=$_hgver"
#        "ftp://ftp.tvdr.de/vdr/Developer/vdr-$_vdrapi.tar.bz2"
	"$pkgname::git+http://github.com/3PO/vdr-plugin-sc.git#commit=$_gitver"
        "ftp://ftp.tvdr.de/vdr/vdr-$_vdrapi.tar.bz2"
#        'http://data.gpo.zugaina.org/vdr-devel/media-plugins/vdr-sc/files/vdr-sc-0.9.3.20120815_vdr-2.1.4_compilefix.diff'
#        'Add_libdvbcsa_support.diff'
	'Makefile.patch'
	'compile.patch'
        "20-$_plugname.conf")
backup=("etc/vdr/conf.avail/20-$_plugname.conf")

pkgver() {
    cd "$srcdir/$pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf "$srcdir/$pkgname-build"
  cp -r "$srcdir/$pkgname" "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"

#  patch -p1 -i "$srcdir/Add_libdvbcsa_support.diff"
#  patch -p1 -i "$srcdir/vdr-sc-0.9.3.20120815_vdr-2.1.4_compilefix.diff"
#  patch -p1 -i "$srcdir/compile.patch"
  patch -p1 -i "$srcdir/Makefile.patch"

#Disable Keyfile support. If you want to watch paytv, pay for it.
#  ( cd systems
#    ls | grep -v cardclient | xargs rm -r )

  sed -i 's/MAXDVBDEVICES/MAXDEVICES/g' device.c

#  ln -sfr "$srcdir/vdr-$_vdrapi/PLUGINS/src/dvbhddevice" "$srcdir"
#  ln -sfr "$srcdir/vdr-$_vdrapi/PLUGINS/src/dvbsddevice" "$srcdir"
}

package() {
  cd "$srcdir/$pkgname-build"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"

#  make CFLAGS="$(pkg-config vdr --variable=cflags)" \
#       CXXFLAGS="$(pkg-config vdr --variable=cxxflags)" \
#       VDRDIR="/usr" \
#       LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
#       LOCALEDIR="$_pkgdir/$(pkg-config vdr --variable=locdir)" \
#       MAXCAID=64 \
#       LIBDVBCSA=1 \
#       i18n systems libsc-dvbhddevice.so libsc-dvbsddevice.so libvdr-$_plugname.so

#export CXXFLAGS="$CXXFLAGS -I/usr/include/openssl-1.0"
#export LDFLAGS="$LDFLAGS -L/usr/lib/openssl-1.0 -lcrypto -lcrypt" 

   make  CFLAGS="$(pkg-config vdr --variable=cflags)" \
     CXXFLAGS="$(pkg-config vdr --variable=cxxflags) -I/usr/include/openssl-1.0 -std=c++0x -Wno-narrowing "\
     LDFLAGS="$LDFLAGS -L/usr/lib/openssl-1.0 -lcrypto -lcrypt" \
     VDRDIR="$(pkg-config vdr --variable=pcfiledir)" \
     LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
     LOCDIR="$pkgdir/$(pkg-config vdr --variable=locdir)" \
     MAXCAID=64 \
     LIBDVBCSA=1 
#     i18n systems
     
echo "pkgdir $pkgdir"
   
   make DESTDIR=${pkgdir} install

#     VDRDIR="/usr" \ #libsc-dvbhddevice.so libsc-dvbsddevice.so libvdr-$_plugname.so

#  install -Dm755 libsc-dvbhddevice.so "$pkgdir/usr/lib/vdr/plugins/libsc-dvbhddevice.so.$_vdrapi"
#  install -Dm755 libsc-dvbsddevice.so "$pkgdir/usr/lib/vdr/plugins/libsc-dvbsddevice.so.$_vdrapi"
#  install -Dm755 libvdr-$_plugname.so "$pkgdir/usr/lib/vdr/plugins/libvdr-$_plugname.so.$_vdrapi"

  install -Dm644 "$srcdir/20-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/20-$_plugname.conf"
}
md5sums=('SKIP'
         '12c6a3abeadfa915fcfe736bb047a3ab'
         'e8ec2e553632a2ab581fbb1d3f2b3bf2'
         '23e9fbdccd207463c1f7d632b58d2a78'
         '397dfba03003ba28c5f95d0855497d78')
