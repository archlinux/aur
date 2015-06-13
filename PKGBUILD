# Maintainer: yhfudev <yhfudev ta gmail dot com>
# Contributor: veox <veox ta wemakethings dot net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Matthias Bauch <matthias.bauch@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

pkgname=openocd-git
_gitname=openocd-git
pkgver=70a14db
pkgrel=1
pkgdesc="Debugging, in-system programming and boundary-scan testing for embedded target devices (git version)"
arch=('i686' 'x86_64' 'arm')
url="http://openocd.org"
license=('GPL')
depends=('libftdi' 'libftdi-compat' 'libusb' 'libusb-compat' 'hidapi' )
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl')
options=(!strip)
install=openocd-git.install
provides=('openocd')
conflicts=('openocd')

source=(
    "${_gitname}::git://git.code.sf.net/p/openocd/code"
    #"openocd-0.9.0-exit-clean.patch"
    )
md5sums=(
    'SKIP'
    )
sha1sums=(
    'SKIP'
    )

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
    #parport-giveio
    #zy1000
    #zy1000-master
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
  #patch -p1 <$srcdir/openocd-0.9.0-exit-clean.patch
}

build() {
  cd "$srcdir/${_gitname}"

  ./bootstrap
  ./configure --prefix=/usr \
    --enable-maintainer-mode \
    --disable-werror \
    ${_features[@]/#/--enable-} \
    $(NULL)

  #make clean
  make
}

package() {
  cd "$srcdir/${_gitname}"
  make DESTDIR=${pkgdir} install
  rm -rf ${srcdir}/$_gitname-build
  rm -rf $pkgdir/usr/share/info/dir
}
