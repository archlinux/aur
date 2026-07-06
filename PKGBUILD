# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xlibre-video-sisusb
_pkgname=xf86-video-sisusb
pkgver=25.0.0
pkgrel=8
pkgdesc="XLibre SiS USB video driver"
arch=(x86_64)
url='https://github.com/X11Libre/xf86-video-sisusb'
license=('BSD-3-Clause')
depends=('glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0')
provides=('xf86-video-sisusb')
conflicts=('xf86-video-sisusb' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha256sums=('470d8cb446797efb133e1a54bf1c1048804cd70843b3fce13700c0b01deeca4d')

prepare() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
