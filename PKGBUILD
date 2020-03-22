#Maintainer: Michael Taboada <michael@2mb.solutions>
#Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=xf86-video-dummy
pkgname=xf86-video-dummy-with-vt
pkgver=0.3.8
pkgrel=6
pkgdesc="X.org dummy video driver with an allocated vt"
arch=(aarch64 armv7h i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0' 'xorgproto')
conflicts=('xorg-server<1.20' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25')
provides=("$_pkgname")
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2{,.sig} dummy_driver.patch)
sha256sums=('3712bb869307233491e4c570732d6073c0dc3d99adfdb9977396a3fdf84e95b9'
            'SKIP'
            'f7504ae284aad2cb5244309c6ba241bad748ec1db2a5fd0986d744b59758d11b')
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C') # Julien Cristau <julien.cristau@ens-lyon.org>

prepare() {
  cd "$srcdir/$_pkgname-$pkgver/src"
  patch -i $srcdir/dummy_driver.patch
}

build() {
  cd ${_pkgname}-${pkgver}

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
