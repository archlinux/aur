# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: monson <holymonson@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: David Manouchehri <david@davidmanouchehri.com>

pkgname=cgminer
pkgver=4.10.0
_pkgver=$pkgver
pkgrel=4
pkgdesc="Multi-threaded multi-pool GPU, FPGA and ASIC miner for bitcoin"
url='http://ck.kolivas.org/apps/cgminer/'
license=('GPL3')
arch=('x86_64')
depends=('curl' 'libusb' 'jansson')
makedepends=('git')
source=("git+https://github.com/ckolivas/${pkgname}.git#tag=v$_pkgver"
        "$pkgname.conf.d"
        "$pkgname.service")
backup=("etc/conf.d/$pkgname" "etc/$pkgname.conf")

prepare() {
  cd $pkgname
  # We have latest jansson and libusb - just use them

  sed -e 's|^AC_CONFIG_SUBDIRS.*compat/jansson-2\.9.*||' \
      -e 's|JANSSON_LIBS="compat/jansson-2\.9/src/\.libs/libjansson\.a"|JANSSON_LIBS=-ljansson|' \
      -e 's|compat/Makefile||' \
      -i ./configure.ac

  sed -e 's|^JANSSON_CPPFLAGS= .*||' \
      -e 's|^USBUTILS_CPPFLAGS = .*|USBUTILS_CPPFLAGS = -I/usr/include/libusb-1.0|' \
      -e 's|^SUBDIRS.*|SUBDIRS = lib ccan|' \
      -i ./Makefile.am

  #sed "s|ac_subdirs_all='compat/libusb\-1.0\ncompat/jansson-2.5'||" -i ./configure
  #sed 's|subdirs="$subdirs compat/libusb\-1.0"||' -i ./configure
  #sed 's|subdirs="$subdirs compat/jansson\-2.5"||' -i ./configure
  #sed 's|LIBUSB_LIBS="compat/libusb-1.0/libusb/.libs/libusb-1.0.a"|LIBUSB_LIBS=-lusb-1.0|' -i ./configure
  #sed 's|JANSSON_LIBS="compat/jansson-2.5/src/.libs/libjansson.a"|JANSSON_LIBS=-ljansson|' -i ./configure
  #sed 's|compat/Makefile ||' -i ./configure

  #sed 's|JANSSON_INCLUDES = .*||' -i ./Makefile.in
  #sed 's|USBUTILS_INCLUDES = .*|USBUTILS_INCLUDES = -I/usr/include/libusb-1.0|' -i ./Makefile.in
  #sed 's|SUBDIRS = lib compat ccan|SUBDIRS = lib ccan|' -i ./Makefile.in

  rm -r compat
}

build() {
  cd $pkgname
  
  # Here you may want to use custom CFLAGS
  #export CFLAGS="-O2 -march=native -mtune=native -msse2"
  
  # ./configure \

  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  # Taken from README - Q: What should I build in for a generic distribution binary?
  ./autogen.sh \
    --prefix=/usr \
    --enable-avalon \
    --enable-avalon2 \
    --enable-avalon4 \
    --enable-bflsc \
    --enable-bitfury \
    --enable-blockerupter \
    --enable-cointerra \
    --enable-drillbit \
    --enable-hashfast \
    --enable-hashratio \
    --enable-icarus \
    --enable-klondike \
    --with-system-libusb
  
  make
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/$pkgname"
  install -m755 miner.php api-example.* "$pkgdir/usr/share/$pkgname"

  install -Dm644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -Dm644 "$srcdir"/$pkgname.conf.d "$pkgdir"/etc/conf.d/$pkgname
  sed 's#/usr/local/bin#/usr/bin#g' example.conf > $pkgname.conf
  install -Dm644 $pkgname.conf "$pkgdir"/etc/$pkgname.conf
}

sha512sums=('SKIP'
            '99c38bc395848f9712ce172343d31f5c60f5d8ac1cfe2f48df8f3ec6c488fc275763a79c5ef36b99f32faa465b5a65284b38e8a63ef9b144075ee13971313b41'
            '3317b60c6b1f14c47d8ee636113ef40a4023ab14054129de80a37947b381fd2b647a7053f4e1bb639efa225a514e862fa531908714c34040dda2d6221dde7f5f')
