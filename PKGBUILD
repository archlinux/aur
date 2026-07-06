# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xlibre-video-fbdev
_pkgname=xf86-video-fbdev
pkgver=25.0.0
pkgrel=8
pkgdesc="XLibre framebuffer video driver"
arch=(x86_64)
license=('X11')
url='https://github.com/X11Libre/xf86-video-fbdev'
depends=('glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0') # git)
provides=('xf86-video-fbdev')
conflicts=('xf86-video-fbdev' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('47d37f0256fcbd1e752d26302ae1b2ab42c107adbce0aaeb773ab620f7f5891e8e51e9ddf1d58702be4b05e759d62cd9d87878fcf17a132c99dad9b6e7317f09')

build() {
  cd $_pkgname-xlibre-$_pkgname-$pkgver

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
  cd $_pkgname-xlibre-$_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-xlibre-$_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
