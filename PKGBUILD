# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=openocd-git-libftdi
pkgver=r132.8fd59d7
pkgrel=1
pkgdesc="Debugging, in-system programming and boundary-scan testing for embedded target devices -using libftdi instead of ftd2xx"
arch=('i686' 'x86_64')
url="http://openocd.org/"
license=('GPL')
depends=('libftdi' 'hidapi')
makedepends=('git' 'automake>=1.11' 'tcl')
provides=('openocd')
conflicts=('openocd')
source=()
md5sums=()
options=(!strip)

_gitroot=git://openocd.git.sourceforge.net/gitroot/openocd/openocd
_gitname=openocd

pkgver() {
	cd "${srcdir}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}"

  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  #
  # Build OpenOCD
	#
  cd "$srcdir/$pkgname-$pkgver"

  ./bootstrap
  ./configure \
	--disable-werror \
	--prefix=/usr \
	--enable-maintainer-mode \
	--enable-parport \
	--enable-ftdi \
	--enable-legacy-ft2232_libftdi \
	--enable-amtjtagaccel \
	--enable-ep93xx \
	--enable-at91rm9200 \
	--enable-gw16012 \
	--enable-presto_libftdi \
	--enable-usbprog \
	--enable-oocd_trace \
	--enable-jlink \
	--enable-vsllink \
	--enable-rlink \
	--enable-stlink \
	--enable-armjtagew \
	--enable-buspirate \
	--enable-usb_blaster_libftdi \
	--enable-osbdm \
	--enable-aice \
	--enable-cmsis-dap \
	--enable-dummy \
	--enable-jtag_vpi \
	--enable-opendous \
	--enable-openjtag_ftdi \
	--enable-remote-bitbang \
	--enable-ti-icdi \
	--enable-ulink \
	--enable-usb-blaster-2

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=${pkgdir}/ install
  rm -rf ${srcdir}/$_gitname-build
  rm -rf ${pkgdir}/usr/share/info/dir
}
