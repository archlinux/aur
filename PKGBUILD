# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=v4l2ucp
pkgver=2.0.2
pkgrel=6
pkgdesc="A universal control panel for Video for Linux Two (V4L2) devices"
arch=('x86_64')
url="http://v4l2ucp.sourceforge.net/"
license=('GPL2')
depends=('qt5-base' 'v4l-utils')
optdepends=('mplayer: video preview')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "qt5.patch")
sha512sums=('4c1e4e9fa5f8388a179632918edda2f5b84737370bf6eb67fe4b05215f0fc67f59df4749d7e86aa4da288da0eedf646978e0c84332054ec561a7c814b079fefc'
            '7c3e8bc6b9027a499871f411a357ddd44d0b109df6744c8484d0cc0ed0dde4007ad0c54ce38628ae3c609c1a136d057d2f654046598a9f24730704c6d9db13dd')

prepare() {
  cd "${pkgname}-${pkgver}"

  # port to Qt5
  patch -Np1 -i ../qt5.patch

  # use videodev2.h header
  sed -i 's/videodev/&2/' src/v4l2ctrl.c

  mkdir -vp build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
