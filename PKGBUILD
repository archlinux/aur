# ex: ts=2 sts=2 sw=2 et
# Maintainer: yhfudev <yhfudev ta gmail dot com>
# Contributor: veox <veox ta wemakethings dot net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Matthias Bauch <matthias.bauch@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

_pkgbase=openocd
pkgname=openocd-git
pkgver=0.12.0.r59.g0b6f53e94
pkgrel=2
pkgdesc="Debugging, in-system programming and boundary-scan testing for embedded target devices (git version)"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="http://openocd.org"
license=('GPL')
depends=('libftdi-compat' 'libusb-compat' 'hidapi' 'libudev.so' 'capstone' 'libjaylink' 'jimtcl' 'libgpiod')
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl')
options=(!strip)
provides=('openocd')
conflicts=('openocd')

source=(
  "${pkgname}::git+https://github.com/openocd-org/openocd.git"
)
sha256sums=('SKIP')

# Specify desired features and device support here. A list can be
# obtained by running ./configure --help in the source directory.
# Other supported drivers are enabled automatically when dependencies are available.
_features=(
    am335xgpio
    amtjtagaccel
    armjtagew
    at91rm9200
    bcm2835gpio
    buspirate
    cklink
    cmsis-dap
    dummy
    ep93xx
    ftdi
    gw16012
    imx-gpio
    jlink
    jtag-vpi
    linuxgpiod
    opendous
    openjtag
    osbdm
    parport
    presto
    remote-bitbang
    rlink
    stlink
    sysfsgpio
    ti-icdi
    ulink
    usb-blaster-2
    usb-blaster
    usbprog
    vsllink
    xlnx-xvc
    )

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long --match 'v[0-9]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname}"
  sed -i 's|GROUP="plugdev", ||g' contrib/60-openocd.rules
}

build() {
  cd "$srcdir/${pkgname}"

  ./bootstrap
  ./configure --prefix=/usr \
    --disable-werror \
    --with-capstone \
    "${_features[@]/#/--enable-}"

  make
}

package() {
  cd "$srcdir/${pkgname}"

  make "DESTDIR=${pkgdir}" install

  install -Dm 644 contrib/60-openocd.rules "$pkgdir"/usr/lib/udev/rules.d/60-openocd.rules
}
