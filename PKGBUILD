# Maintainer: chenss <ufbycd at 163 dot com>

_pkgbase=openocd-nuvoton
pkgname=${_pkgbase}-git
pkgver=0.9.0.r476.g849799e6
pkgrel=2
pkgdesc='Fork of OpenOCD that has Nuvoton devices support'
arch=('x86_64')
url='https://github.com/OpenNuvoton/OpenOCD-Nuvoton'
license=('GPL')
depends=('libftdi' 'libftdi-compat' 'libusb' 'libusb-compat' 'hidapi' )
makedepends=('git' 'automake>=1.9' 'autoconf>=2.64' 'libtool' 'tcl')
options=()

source=(
    "$pkgname::git+https://github.com/ufbycd/OpenOCD-Nuvoton.git")

md5sums=('SKIP')

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
    nulink
    )

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --program-suffix=-nuvoton \
    --disable-werror \
    --with-gnu-ld \
    ${_features[@]/#/--enable-}

  make pkgdatadir="/usr/share/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  make pkgdatadir="/usr/share/$pkgname" DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/lib/udev/rules.d"
  mv "$pkgdir/usr/share/$pkgname/contrib/60-openocd-nuvoton.rules" "$pkgdir/usr/lib/udev/rules.d/60-openocd-nulink.rules"
  mv "$pkgdir/usr/share/$pkgname/contrib/99-openocd.rules" "$pkgdir/usr/lib/udev/rules.d/99-${pkgname}.rules"

  rm -r "$pkgdir/usr/share/info"
}

# makepkg --printsrcinfo > .SRCINFO
