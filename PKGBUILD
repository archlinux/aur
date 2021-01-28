# ex: ts=2 sts=2 sw=2 et
# Maintainer: jamon <aur ta jamonterrell dot com>
# Contributor: yhfudev <yhfudev ta gmail dot com>
# Contributor: veox <veox ta wemakethings dot net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Matthias Bauch <matthias.bauch@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

_pkgbase=openocd
pkgname=openocd-picoprobe
pkgver=makepkg.0.g14c0d0d33
pkgrel=1
pkgdesc="Debugging, in-system programming and boundary-scan testing for embedded target devices (raspberry pi pico version)"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="http://openocd.org"
license=('GPL')
depends=('libftdi' 'libftdi-compat' 'libusb' 'libusb-compat' 'hidapi' )
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl' 'pkgconf')
options=(!strip)
provides=('openocd')
conflicts=('openocd')

source=(
  "${pkgname}::git+https://github.com/raspberrypi/openocd.git#branch=picoprobe"
)
#	"git+http://repo.or.cz/r/git2cl.git"
#	"git+http://repo.or.cz/r/jimtcl.git"
#	"git+http://repo.or.cz/r/libjaylink.git"
md5sums=('SKIP')
sha1sums=('SKIP')

# Specify desired features and device support here. A list can be
# obtained by running ./configure in the source directory.
_features=(
    aice
    amtjtagaccel
    armjtagew
    at91rm9200
    bcm2835gpio
    buspirate
    cmsis-dap
    dummy
    ep93xx
    ftdi
    gw16012
    ioutil
    jlink
    jtag_vpi
    legacy-ft2232_libftdi
    oocd_trace
    opendous
    openjtag_ftdi
    osbdm
    parport
    picoprobe
    presto_libftdi
    remote-bitbang
    rlink
    stlink
    sysfsgpio
    ti-icdi
    ulink
    usb-blaster-2
    usb_blaster_libftdi
    usbprog
    vsllink
    xlnx_pcie_xvc
    #parport-giveio
    #zy1000
    #zy1000-master
    )

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --all --long | sed -E 's/^[^/]*\///g;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname}"
}

build() {
  cd "$srcdir/${pkgname}"

  ./bootstrap
  ./configure --prefix=/usr \
    --enable-maintainer-mode \
    --disable-werror \
    ${_features[@]/#/--enable-}

  #make clean
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make "DESTDIR=${pkgdir}" install
  rm -rf ${srcdir}/$pkgname-build
  rm -rf "$pkgdir/usr/share/info/dir"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d"
  mv "$pkgdir/usr/share/$_pkgbase/contrib/60-openocd.rules" "$pkgdir/usr/lib/udev/rules.d"
}
