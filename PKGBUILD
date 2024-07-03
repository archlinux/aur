# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=rlvm
_pkgver=38c808e33acb7f6273ecd764c6ad948424eb7626
pkgver=0.14.r79.38c808e3
pkgrel=2
pkgdesc="RealLive clone for Linux and OSX"
arch=('x86_64')
url="https://github.com/eglaysher/rlvm"
license=('GPL-3.0-or-later')
depends=('boost-libs>=1.46' 'glew' 'libmad' 'libogg' 'libvorbis' 'libpng'
         'sdl_mixer' 'sdl_image' 'sdl_ttf' 'guichan' 'gtk3')
makedepends=('scons' 'boost')
source=("https://github.com/eglaysher/rlvm/archive/$_pkgver.tar.gz"
        "includes.patch"
        "warnings.patch"
        "gtk+3.patch")
sha256sums=('3c5a84d4c2ccf1693c2d3a23b51d8642c798bdf8bc189e5e0ac28ede27ec7dad'
            '05b4c17fe4132b3877b53ba34076c4f21b0982d40ec134400697a51f7ea52226'
            '9e7d10880051c11062b67ca9ac5f53bf7277588228f0103e93ac6cccb72e57cc'
            '6bf8a1d8cd64b05057859338132acef11db573c58adc3913679776b8d4a7b83a')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"
  patch -Np1 -i "$srcdir/includes.patch"
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
