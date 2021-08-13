# ex: ts=2 sts=2 sw=2 et
# Maintainer: yhfudev <yhfudev ta gmail dot com>
# Contributor: veox <veox ta wemakethings dot net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Matthias Bauch <matthias.bauch@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

_pkgbase=openocd
pkgname=openocd-riot-git
pkgver=0.11.0.r282.gae6de2f93
pkgrel=2
pkgdesc="Debugging, in-system programming and boundary-scan testing for embedded target devices (git version with extra RIOT patches)"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="http://openocd.org"
license=('GPL')
depends=('libftdi' 'libftdi-compat' 'libusb' 'libusb-compat' 'hidapi' )
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl')
options=(!strip)
provides=('openocd')
conflicts=('openocd')

source=(
  "${pkgname}::git+https://repo.or.cz/openocd.git#commit=ae6de2f93"
  "0001-fix-corrupt-target.patch"
  "0002-fix-optional-symbols.patch"
)
#	"git+http://repo.or.cz/r/git2cl.git"
#	"git+http://repo.or.cz/r/jimtcl.git"
#	"git+http://repo.or.cz/r/libjaylink.git"
md5sums=('SKIP'
         '1c3bb06054a3e2b36975784c81d6b3df'
         '654334beb4cd0c3618b2ba86f73109a8')
sha1sums=('SKIP'
          'caaae2bedf536ccb7fb794272c3a77c4023b9f16'
          'df65ed79c1a0dc6c4dc3b59b0c508915e261719b')

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
    )

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname}"
  patch -p1 -i ../0001-fix-corrupt-target.patch
  patch -p1 -i ../0002-fix-optional-symbols.patch
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
