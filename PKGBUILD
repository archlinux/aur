# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=13.4.0
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('mesa' 'systemd-libs')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=25.2') # 'git')
conflicts=('xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<25' 'X-ABI-VIDEODRV_VERSION>=26')
groups=('xorg-drivers')
options=('!emptydirs')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('7cacde21a490501dd9c2e9121040274c1f6ef64e6dc0ef49946b400f6297fab73a6e9548e45fe8930cee9028e65e45aaff9ba489dd69ac75a5133114726bf55d'
            'SKIP')
#validpgpkeys=('90D027AEAF33CBABC140735BC1F5D3CDF5176580') #  Thomas Hellstrom (VMware) <thellstrom@vmware.com>
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  cd ${pkgname}-${pkgver}

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./configure --prefix=/usr --enable-vmwarectrl-client
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
