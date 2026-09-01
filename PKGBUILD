pkgname=openocd-stm
pkgver=2.2.0
pkgrel=1
pkgdesc='Debugging, in-system programming and boundary-scan testing for embedded target devices'
arch=(x86_64)
url='https://openocd.org'
license=(GPL-2.0-or-later)
depends=(
  capstone
  glibc
  hidapi
  jimtcl
  libftdi-compat
  libjaylink
  libusb
)
makedepends=(
  git
)
provides=('openocd')
conflicts=('openocd')
source=(
  "$pkgname::git+https://github.com/STMicroelectronics/openocd#tag=openocd-cubeide-v$pkgver"
  no-duplicate-udev-rules.patch
  jimtcl-fix.patch
)
sha512sums=('edae0023dbecff3f383373256e17c0eb7551a194cf36bd5c6418e00f9359362c10d705de8c503e2cb50b98c338114984cd9da7f61c46f8f0508a8108221bd777'
            '139a3b007ef6df3047aaabe7b9878d2a09b67a0dc6cd17174a5d42692ac10e9ccddec1a39fb325e4a017041b118297e27e657518c1f203bba5f23d8b468b7946'
            '8e67eb2c2b1da3153bff99686e6d438ca288bbe3f19cf4c93e2537e2b9e5cf06d13602c18591940bb023828eb3db08cce8bb2ef4b930021578c6d67f606b1bad')
b2sums=('05e9693c9496076475ebaba093028aff033f9a9341e2630d964db8e1344d9597b9359f2962a584dc609a5a3e2dc099b12279d7471e8a6097e122ee807e6366fe'
        'ee308dd9c85a4fba4c75bff443fb9eeb46f4d8000c9c7308e7e378baed95f3c4fd6f9dc872f5b1b4110cacc9b05a92a8cb50cecdc7b8b8f128b213cc572f6317'
        '6acfa4990cb818bdfd8b89010156a2c35b50f65f35033c3f286c4b05d05828d8c9d24c02f80bb43af6e04faf01b2d5c759b367ef9f7932ca496b9a3ba6a720e0')

prepare() {
  cd "$pkgname"

  # modify udev rules
  sed -i 's|GROUP="plugdev", ||g' contrib/60-openocd.rules

  # ensure udev rules are not duplicated
  patch -p1 -i "$srcdir/no-duplicate-udev-rules.patch"

  # fix build with jimtcl 0.83+
  patch -p1 -i "$srcdir/jimtcl-fix.patch"

  # revert workarounds for jimtcl expr syntax changes
  git cherry-pick --no-commit 95603fae18f81eebdafc5b318e70f9e2cdefab9e

  # run autotools configuration
  # all submodules are unnecessary, so skip setup
  ./bootstrap nosubmodule
}

build() {
  cd "$pkgname"

  local _features=(
    aice
    amtjtagaccel
    armjtagew
    at91rm9200
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
  )

  ./configure \
    --prefix=/usr \
    --disable-werror \
    --disable-internal-jimtcl \
    --disable-internal-libjaylink \
    ${_features[@]/#/--enable-}

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install

  install -vDm644 -t "$pkgdir/usr/lib/udev/rules.d" contrib/60-openocd.rules
}
