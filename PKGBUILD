# Maintainer: yhfudev <yhfudev ta gmail dot com>
# Contributor: veox <veox ta wemakethings dot net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Matthias Bauch <matthias.bauch@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

pkgname=openocd-git
_gitname=openocd
pkgver=6734.09ca5af
pkgrel=1
pkgdesc="Debugging, in-system programming and boundary-scan testing for embedded target devices (git version)"
arch=('i686' 'x86_64' 'arm')
url="http://openocd.sourceforge.net/"
license=('GPL')
depends=('libftdi' 'libftdi-compat' 'libusb' 'libusb-compat')
optdepends=('libftdi: support devices using this FTDI implementation'
            'libftd2xx: support devices using this FTDI implementation'
            'hidapi: support CMSIS-DAP compliant devices')
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl')
options=(!strip)
install=openocd-git.install
provides=('openocd')
conflicts=('openocd')

source=(
    "${_gitname}::git://git.code.sf.net/p/openocd/code"
    "openocd-0.9.0-exit-clean.patch"
    )
md5sums=(
    'SKIP'
    '72f43470849c08d298a8de6b4598ba3b'
    )
sha1sums=(
    'SKIP'
    '5456bd27e1bdb466a3df12f163efb8b6128429b9'
    )

# Specify desired features and device support here. A list can be
# obtained by running ./configure in the source directory.
_features=(
    sysfsgpio amtjtagaccel arm-jtag-ew at91rm9200 buspirate ep93xx ftdi gw16012 jlink
    oocd_trace opendous osbdm parport presto_libftdi remote-bitbang rlink stlink ti-icdi
    ulink usbprog vsllink
    arm-jtag-ew dummy
    )

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

prepare() {
  cd "$srcdir/${_gitname}"
  patch -p1 <$srcdir/openocd-0.9.0-exit-clean.patch
}

build() {
  cd "$srcdir/${_gitname}"

  ./bootstrap
  ./configure --prefix=/usr \
    --enable-maintainer-mode \
    --disable-werror \
    ${_features[@]/#/--enable-} \
    --enable-legacy-ft2232_libftdi \
    --enable-usb_blaster_libftdi \
    $(NULL)

  make
}

package() {
  cd "$srcdir/${_gitname}"
  make DESTDIR=${pkgdir} install
  #rm -rf ${srcdir}/$_gitname-build
  #rm -rf $pkgdir/usr/share/info/dir
}
