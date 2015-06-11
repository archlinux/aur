# Maintainer: Mateusz Lemusisk <mrlemux@gmail.com>
# Based on xf86-input-libinput by Laurent Carlier <lordheavym@gmail.com>

pkgname=xf86-input-libinput-git
pkgver=0.11.0.r0.g449b496
pkgrel=1
pkgdesc="Generic input driver for the X.Org server based on libinput. Git version"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libinput')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=22.1' 'libxi' 'libx11' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.16' 'X-ABI-XINPUT_VERSION<22' 'X-ABI-XINPUT_VERSION>=23' xf86-input-libinput)
provides=xf86-input-libinput
groups=('xorg-drivers' 'xorg')
source=(git://anongit.freedesktop.org/xorg/driver/xf86-input-libinput
        90-libinput.conf)
sha256sums=('SKIP'
            'd4a728caadb7924852dcdc0da4de950c6fb9ebd8999d4e3af3d0baaa51cd0e75')

pkgver() {
    cd xf86-input-libinput
git describe --long | sed 's/^xf86.input.libinput.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/xf86-input-libinput"
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd xf86-input-libinput
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/X11/xorg.conf.d"
  install -m644 ../90-libinput.conf "${pkgdir}/usr/share/X11/xorg.conf.d/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

