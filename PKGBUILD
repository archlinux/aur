# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2
pkgver=2.1.10
pkgrel=1
pkgdesc='A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2")'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.srb2.org'
depends=('sdl2_mixer' 'libpng' "srb2-data=$pkgver")
makedepends=('subversion' 'mesa' 'glu')
[ "$CARCH" == "i686" ] && makedepends+=('nasm')
source=("https://github.com/STJr/SRB2/archive/SRB2_release_$pkgver.zip")
sha256sums=('9a39b994af6775d519e6e3bc8888c92da23e49db24538ad4f9063fe63fb51acf')

prepare() {
  # disable Animated PNG saving support, breaks build
  sed 's|#define USE_APNG|/* & */|' -i SRB2-SRB2_release_$pkgver/src/m_misc.c
}

build() {
  cd SRB2-SRB2_release_$pkgver/src

  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  # build with system libpng and do not upx binary
  make LINUX$IS64BIT=1 PNG_CONFIG=libpng-config NOUPX=1
}

package() {
  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 SRB2-SRB2_release_$pkgver/bin/Linux$IS64BIT/Release/lsdl2srb2 \
    "$pkgdir"/usr/bin/srb2
}
