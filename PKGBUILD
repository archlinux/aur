# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
# Credit: Laurent Carlier <lordheavym@gmail.com>

pkgname=xf86-video-amdgpu-git
_pkgbase=xf86-video-amdgpu
pkgver=1.2.0.r20.g5f71238
pkgrel=2
pkgdesc="X.org amdgpu video driver"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libsystemd' 'mesa')
makedepends=('xorg-server-devel' 'systemd' 'X-ABI-VIDEODRV_VERSION=23')
conflicts=('xf86-video-amdgpu' 'xorg-server<1.19.0' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
provides=('xf86-video-amdgpu')
groups=('xorg-drivers')
source=('xf86-video-amdgpu::git://anongit.freedesktop.org/xorg/driver/xf86-video-amdgpu#branch=master')
md5sums=('SKIP')
validpgpkeys=('B09FAF35BE914521980951145A81AF8E6ADBB200') # Michel Daenzer <michel@daenzer.net>


pkgver() {
  cd "${_pkgbase}"
  ( set -o pipefail
  git describe --long | sed 's/^xf86-video-amdgpu-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

build() {
  cd "${_pkgbase}"

  ./autogen.sh --prefix=/usr \
    --enable-glamor
  make
}

package() {
  cd "${_pkgbase}"

  make "DESTDIR=${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
