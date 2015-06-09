# $Id: PKGBUILD 223710 2014-09-30 12:55:21Z bpiotrowski $
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_pkgbasename=libva-intel-driver
pkgname=lib32-libva-intel-driver
pkgver=1.5.0
pkgrel=1
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family'
arch=('x86_64')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=('lib32-libva>=1.5.0')
replaces=('lib32-libva-driver-intel')
source=(http://freedesktop.org/software/vaapi/releases/$_pkgbasename/$_pkgbasename-$pkgver.tar.bz2)
md5sums=('16752f1584398265072129553b7907ce')

prepare() {
  cd $_pkgbasename-$pkgver

  # Only relevant if intel-gpu-tools is installed,
  # since then the shaders will be recompiled
  sed -i '1s/python$/&2/' src/shaders/gpp.py
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_pkgbasename-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib32
  make 
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

