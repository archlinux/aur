# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xlibre-video-vesa
_pkgname=xf86-video-vesa
pkgver=25.0.0
pkgrel=8
pkgdesc="XLibre vesa video driver"
arch=(x86_64)
license=('MIT')
url='https://github.com/X11Libre/xf86-video-vesa'
depends=('glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0')
provides=('xf86-video-vesa')
conflicts=('xf86-video-vesa' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('6d740f508370f9f7e627230daa0a98b2e9868963c02591aadeb7fefd81d9b725b1b23fba9a2460acacd971f01ddb1ba732821a1d7bba3ce979613a5074d2d74b')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

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

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
