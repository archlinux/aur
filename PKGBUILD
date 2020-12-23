# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: kokoko3k <kokoko3k at gmail dot com>
# Contributor: Ionut Biru <ibiru at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>

pkgname=lib32-libva-minimal-git
pkgver=2.10.0
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux (32-bit)'
arch=(x86_64)
url='https://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=(lib32-libdrm lib32-libgl lib32-wayland lib32-libxext lib32-libxfixes libva)
makedepends=(mesa lib32-libglvnd)
optdepends=('lib32-libva-vdpau-driver: vdpau back-end for nvidia'
            'lib32-libva-intel-driver: back-end for intel cards')
provides=(lib32-libva)
conflicts=(lib32-libva)
source=("git+https://github.com/intel/libva.git")
sha512sums=('SKIP')

pkgver() {
	  cd libva
	  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd libva
  ./autogen.sh --prefix=/usr --libdir='/usr/lib32' --enable-docs=no --enable-va-messaging=no 
  make
}

package() {
  cd libva
  make DESTDIR="${pkgdir}" install
  rm -rfv "${pkgdir}/usr/"{include,bin}
  install -m644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
