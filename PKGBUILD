# Maintainer: PASRC <pasrc at proton dot me>
# Contributor: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=lib32-libtas
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries (32-bit support)"
pkgver=1.4.8
pkgrel=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL-3.0-or-later')
depends=("libtas=${pkgver}" 'lib32-alsa-lib' 'lib32-libx11' 'lib32-gcc-libs')
makedepends=('sdl2' 'ffmpeg' 'libxcb' 'xcb-util-keysyms')
optdepends=('lib32-ffmpeg: audio mixing/resampling in 32-bit games')
source=("${url}/archive/v${pkgver}.tar.gz"
	"0002-fix-SharedConfig-variable-not-being-initialized-at-compile-time.patch")
b2sums=('8f65d0b4b88481ea05161f0ab67abc5eca0ceea100e57df1b0dd63d4ad346dcb4e3f3a87c10a5be8cb76ce8d843bc167bb708cfdd717fa6d97f4f0e2080ac435'
	'b93b249843af87b6a53c806292681a3e0015ec73c4ccdca740230e71f2c7e044571ac561bd522bc45d6994f3665270e3a09fb5e1827abf216204516ece7e2642')

prepare() {
  cd "libTAS-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  autoreconf -i
}

build() {
  cd "libTAS-$pkgver"

  ./configure --prefix=/usr --enable-release-build --enable-i386-lib
  make
}

package() {
  cd "libTAS-$pkgver"

  make DESTDIR="$pkgdir/" install
}
