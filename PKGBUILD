# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=xf86-video-amdgpu-git
_pkgbase=xf86-video-amdgpu
pkgver=1.1.0.r46.g73c8dc0
pkgrel=1
pkgdesc="X.org amdgpu video driver"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm' 'systemd' 'mesa-dri')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=20')
conflicts=('xorg-server<1.18.0' 'X-ABI-VIDEODRV_VERSION<20' 'X-ABI-VIDEODRV_VERSION>=21' 'xf86-video-amdgpu') 
provides=('xf86-video-amdgpu')
groups=('xorg-drivers' 'xorg')
source=('xf86-video-amdgpu::git://anongit.freedesktop.org/xorg/driver/xf86-video-amdgpu#branch=master')
md5sums=('SKIP')
validpgpkeys=('B09FAF35BE914521980951145A81AF8E6ADBB200') # Michel Daenzer <michel@daenzer.net>


pkgver() {
  cd "$srcdir/${_pkgbase}"
  ( set -o pipefail
  git describe --long | sed 's/^xf86-video-amdgpu-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

build() {
  cd "$srcdir/${_pkgbase}"

  ./autogen.sh --prefix=/usr \
    --enable-glamor
  make
}

package() {
  cd "$srcdir/${_pkgbase}"

  make "DESTDIR=${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
