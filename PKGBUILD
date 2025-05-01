# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=rlvm
_pkgver=e38cda7783dc67539ce27901596ed93a2bb5c826
pkgver=0.14.r94.e38cda77
pkgrel=1
pkgdesc="RealLive clone for Linux and OSX"
arch=('x86_64')
url="https://github.com/eglaysher/rlvm"
license=('GPL-3.0-or-later')
depends=('boost-libs>=1.46' 'glew' 'libmad' 'libogg' 'libvorbis' 'libpng'
         'sdl_mixer' 'sdl_image' 'sdl_ttf' 'guichan' 'gtk3')
makedepends=('scons' 'boost')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/eglaysher/rlvm/archive/$_pkgver.tar.gz"
        "tests.patch"
        "warnings.patch"
        "gtk+3.patch")
sha256sums=('c2d595060cce52494d82ef59bed205fd427890b4a7e9b09465e01da8a431a3fd'
            'c22775cdf6f1cecee86047b0b0ed9d21c5d3425813a395fb2913e644064070bb'
            'dcbd9e0de8ccb91983d691f0b5fd6938fef45653ac20d244c1c19a3df01b7550'
            '6bf8a1d8cd64b05057859338132acef11db573c58adc3913679776b8d4a7b83a')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"
  patch -Np1 -i "$srcdir/tests.patch"
  patch -Np1 -i "$srcdir/warnings.patch"
  patch -Np1 -i "$srcdir/gtk+3.patch"
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  scons --release
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  install -Dm755 build/release/rlvm "$pkgdir/usr/bin/rlvm"
  install -Dm644 src/platforms/gtk/rlvm.desktop "$pkgdir/usr/share/applications/rlvm.desktop"

  local _i
  for _i in 16 24 32 48 128 256; do
    install -Dm644 "resources/$_i/rlvm.png" "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/rlvm.png"
  done
}
