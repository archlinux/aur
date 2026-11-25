# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Maintainer: PASRC <pasrc at proton dot me>
# Contributor: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.4.8
pkgrel=7
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'ffmpeg' 'hicolor-icon-theme' 'libcap' 'libx11' 'libxcb'
         'lua' 'qt5-base' 'xcb-util-keysyms')
makedepends=('sdl2')
optdepends=('lib32-libtas: for 32-bit games support')
source=("${url}/archive/v${pkgver}.tar.gz"
	"0001-fix-savestate-crash-on-new-kernels.patch"
	"0002-fix-SharedConfig-variable-not-being-initialized-at-compile-time.patch")
b2sums=('8f65d0b4b88481ea05161f0ab67abc5eca0ceea100e57df1b0dd63d4ad346dcb4e3f3a87c10a5be8cb76ce8d843bc167bb708cfdd717fa6d97f4f0e2080ac435'
	'9e4b8aaf35b341e982f34b352b913b825e90dfd6be2fe6a8b051b499d58acf83212af5e5e252716f314dc1f61ee74252532811129c80edfef7a7257d12b379f9'
	'b93b249843af87b6a53c806292681a3e0015ec73c4ccdca740230e71f2c7e044571ac561bd522bc45d6994f3665270e3a09fb5e1827abf216204516ece7e2642')

prepare() {
  cd libTAS-$pkgver

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

  ./configure --prefix=/usr --enable-release-build
  make
}

package() {
  cd "libTAS-$pkgver"

  make DESTDIR="$pkgdir/" install
}
