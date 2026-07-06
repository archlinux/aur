# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: buddabrod <buddabrod@gmail.com>

pkgname=xlibre-video-nouveau
_pkgname=xf86-video-nouveau
pkgver=25.0.0
pkgrel=8
pkgdesc="XLibre Open Source 3D acceleration driver for nVidia cards"
arch=('x86_64')
url='https://github.com/X11Libre/xf86-video-nouveau'
license=('MIT')
depends=('systemd-libs' 'mesa' 'libdrm' 'glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0' 'systemd')
provides=('xf86-video-nouveau')
conflicts=('xf86-video-nouveau' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7220f29c98746c98299c269e915743ac685644e0331b5a41e798dba8f4cc6add7650b6fee6890b3f7e69ee9624c67e7bf5f01fe374a6a0588347e8531ff59401')

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
  make DESTDIR="$pkgdir" install
}
