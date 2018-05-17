# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=13.3.0
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('mesa' 'libsystemd')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0' 'git')
conflicts=('xorg-server<1.20' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25')
groups=('xorg-drivers')
options=('!emptydirs')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig}
        gcc8.diff)
sha512sums=('c318de893cae7b2b11e11c1b389ee47478b7c8d1f52c27099dbe453efec28f3e9da449217307a8c2251999eada66312f766996be1a6ead413b8b6dedc42c68ca'
            'SKIP'
            'd05522c84dfa1a88bb9e892087f0a67968142b87f1d7f902e8d77150eae7a26ef7f43cef256d2173be060042b86336123fa7c7f521b37ca98f8fb45871bf30ad')
validpgpkeys=('90D027AEAF33CBABC140735BC1F5D3CDF5176580') #  Thomas Hellstrom (VMware) <thellstrom@vmware.com>

prepare() {
  cd $pkgname-${pkgver}
  patch -Np0 -i ../gcc8.diff
}

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
