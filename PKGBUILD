# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=rlvm
_pkgver=af2ae0e649f5df370fe63e493119c1c944798044
pkgver=0.14.r91.af2ae0e6
pkgrel=1
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
sha256sums=('d4b26ed3680f93352bf851a8387d29ccf99ed76ec07b02e5ff8bcab98e1d272c'
            '56ba8679f806163e30962a0418ba462edca52050c6ac88edfadaead68a1b94a8'
            'dcbd9e0de8ccb91983d691f0b5fd6938fef45653ac20d244c1c19a3df01b7550'
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
