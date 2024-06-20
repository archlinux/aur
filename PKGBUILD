# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Based on https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=cgminer

pkgname=cgminer-git
_pkgname=cgminer
pkgver=4.9.2.r703.g151fc74
pkgrel=1
pkgdesc="Multi-threaded multi-pool GPU, FPGA and ASIC miner for bitcoin"
url='https://github.com/cmmodtools/cgminer'
license=('GPL3')
arch=('x86_64' 'i386' 'armv7h')
depends=('curl' 'libusb' 'jansson')
makedepends=('git')
conflicts=('cgminer')
source=("git+https://github.com/cmmodtools/$_pkgname.git"
        "$_pkgname.conf.d"
        "$_pkgname.service")
backup=("etc/conf.d/$_pkgname" "etc/$_pkgname.conf")

sha512sums=('SKIP'
            '99c38bc395848f9712ce172343d31f5c60f5d8ac1cfe2f48df8f3ec6c488fc275763a79c5ef36b99f32faa465b5a65284b38e8a63ef9b144075ee13971313b41'
            '3317b60c6b1f14c47d8ee636113ef40a4023ab14054129de80a37947b381fd2b647a7053f4e1bb639efa225a514e862fa531908714c34040dda2d6221dde7f5f')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  # We have latest jansson and libusb - just use them

  sed -e 's|^AC_CONFIG_SUBDIRS.*compat/jansson-2\.9.*||' \
      -e 's|JANSSON_LIBS="compat/jansson-2\.9/src/\.libs/libjansson\.a"|JANSSON_LIBS=-ljansson|' \
      -e 's|compat/Makefile||' \
      -i ./configure.ac

  sed -e 's|^JANSSON_CPPFLAGS= .*||' \
      -e 's|^USBUTILS_CPPFLAGS = .*|USBUTILS_CPPFLAGS = -I/usr/include/libusb-1.0|' \
      -e 's|^SUBDIRS.*|SUBDIRS = lib ccan|' \
      -i ./Makefile.am

  rm -r compat
}

build() {
  cd $_pkgname

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
  cd $_pkgname

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/$_pkgname"
  install -m755 miner.php api-example.* "$pkgdir/usr/share/$_pkgname"

  install -Dm644 "$srcdir"/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
  install -Dm644 "$srcdir"/$_pkgname.conf.d "$pkgdir"/etc/conf.d/$_pkgname
  sed 's#/usr/local/bin#/usr/bin#g' example.conf > $_pkgname.conf
  install -Dm644 $_pkgname.conf "$pkgdir"/etc/$_pkgname.conf
}
