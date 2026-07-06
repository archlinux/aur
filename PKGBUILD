# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xlibre-video-ati
_pkgname=xf86-video-ati
pkgver=25.0.1
pkgrel=4
epoch=1
pkgdesc="XLibre ati video driver"
arch=('x86_64')
url='https://github.com/X11Libre/xf86-video-ati'
license=('MIT')
depends=('systemd-libs' 'mesa' 'libpciaccess' 'libdrm' 'glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'systemd' 'X-ABI-VIDEODRV_VERSION=28.0') # 'git')
provides=('xf86-video-ati')
conflicts=('xf86-video-ati' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e9899357107359dfd67137217daad3d85ba0a6a7a84ed93f3672a060df8e25eafd7ceffdf61cfc1a8bf28c0f3e62c4596eac5d53b7a0ad5dcb17c7475af9c84b')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

#  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

  make "DESTDIR=${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
