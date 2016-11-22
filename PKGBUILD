# Maintainer: Det <thatone>
# Contributor: Mateusz Lemusisk <mrlemux@gmail.com>
# Based on extra/xf86-input-libinput by: Laurent Carlier <lordheavym@gmail.com>:
# https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/xf86-input-libinput

_pkgname=xf86-input-libinput
pkgname=xf86-input-libinput-git
pkgver=0.22.0.6.r200.ga61e156
pkgrel=3
pkgdesc="Generic input driver for the X.Org server based on libinput - Git version"
arch=('i686' 'x86_64')
license=('custom')
url="https://cgit.freedesktop.org/xorg/driver/xf86-input-libinput/"
depends=('libinput>=1.2.0')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION' 'libxi' 'libx11' 'resourceproto' 'scrnsaverproto' 'git')
provides=("${_pkgname}=${pkgver}" 'xf86-input-driver')
conflicts=('xorg-server<1.18.0' 'X-ABI-XINPUT_VERSION<22' "${_pkgname}")
groups=('xorg-drivers' 'xorg')
source=("git://anongit.freedesktop.org/xorg/driver/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  
  echo $(git describe --long | cut -d "-" -f4-5 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f6)
}

build() {
  cd ${_pkgname}

  msg2 "Starting ./autogen.sh..."
  ./autogen.sh  --prefix=/usr \
                --disable-static

  msg2 "Starting make..."
  make
}

package() {
  cd ${_pkgname}

  msg2 "Starting 'make install'..."
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}