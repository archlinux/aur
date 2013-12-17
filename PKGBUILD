# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=13.0.1
pkgrel=2
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm' 'svga-dri' 'mesa>=10.0')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=14' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.14.0' 'X-ABI-VIDEODRV_VERSION<14' 'X-ABI-VIDEODRV_VERSION>=15')
groups=('xorg-drivers' 'xorg')
options=('!emptydirs')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
	xatracker-v2-fixes.patch)
sha256sums=('802dda415c22412edad6c3df44fe18a06e91d0f8456d9a58bac0d340fdf8fe3d'
            '7ab392cbc6258dc36df14ef60072c655d850bcfb6885111b41bcfe25dc1faacc')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # grab from upstream git repo, needed for mesa>10.0
  patch -Np1 -i ../xatracker-v2-fixes.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-vmwarectrl-client
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
