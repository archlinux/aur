#Maintainer: Michael Taboada <michael@2mb.solutions>
#Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgname=xf86-video-dummy
pkgname=xf86-video-dummy-with-vt
pkgver=0.4.1
pkgrel=1
pkgdesc="X.org dummy video driver with an allocated vt"
arch=(aarch64 armv7h i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=25.2' 'xorgproto')
conflicts=('xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<25' 'X-ABI-VIDEODRV_VERSION>=26')
provides=("$_pkgname")
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${_pkgname}-${pkgver}.tar.xz{,.sig} dummy_driver.patch)
sha256sums=('351920a7fd0f759a3ac972a5999b3ffed46f07fb52a99f319bfb5b6a59d3dfaf'
            'SKIP'
            'f7504ae284aad2cb5244309c6ba241bad748ec1db2a5fd0986d744b59758d11b')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

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
