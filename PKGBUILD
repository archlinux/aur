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
pkgrel=1
pkgdesc="Debugging, in-system programming and boundary-scan testing for embedded target devices (git version)"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="http://openocd.org"
license=('GPL')
depends=('libftdi-compat' 'libusb-compat' 'hidapi' 'libudev.so' 'capstone' 'libjaylink')
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl')
options=(!strip)
provides=('openocd')
conflicts=('openocd')

source=(
  "${pkgname}::git+https://repo.or.cz/openocd.git"
  "git+https://github.com/msteveb/jimtcl.git"
  "git+https://gitlab.zapb.de/libjaylink/libjaylink.git"
  "git+https://git.savannah.nongnu.org/git/git2cl.git"

)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

# Specify desired features and device support here. A list can be
# obtained by running ./configure in the source directory.
_features=(
    aice
    amtjtagaccel
    armjtagew
    at91rm9200
    bcm2835gpio
    buspirate
    capstone
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
    )

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname}"
  sed -i 's|GROUP="plugdev", ||g' contrib/60-openocd.rules
  git submodule init
  git config submodule.jimtcl.url "$srcdir/jimtcl"
  git config submodule."src/jtag/drivers/libjaylink".url "$srcdir/libjaylink"
  git config submodule."tools/git2cl".url "$srcdir/git2cl"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/${pkgname}"

  ./bootstrap
  ./configure --prefix=/usr \
    --disable-werror \
    ${_features[@]/#/--enable-}

  make
}

package() {
  cd "$srcdir/${pkgname}"

  make "DESTDIR=${pkgdir}" install

  install -Dm 644 contrib/60-openocd.rules "$pkgdir"/usr/lib/udev/rules.d/60-openocd.rules
}
