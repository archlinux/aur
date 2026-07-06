# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xlibre-video-vmware
_pkgname=xf86-video-vmware
pkgver=25.0.0
pkgrel=10
pkgdesc="XLibre vmware video driver"
arch=(x86_64)
url='https://github.com/X11Libre/xf86-video-vmware'
license=('MIT AND X11')
depends=('mesa' 'systemd-libs' 'libxext' 'libx11' 'libdrm' 'glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0') # 'git')
provides=('xf86-video-vmware')
conflicts=('xf86-video-vmware' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
options=('!emptydirs')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('bf313507dd3f2b54c151269ac59c1a27cb6122603f3b11ae50620ff77d930b45d2cdbc9ae943cb100cd6a164cb520e50499441ebdf0e1f22fa045fe3c0a91a5d')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --enable-vmwarectrl-client
  make
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
