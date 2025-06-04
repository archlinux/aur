# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=rlvm
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="RealLive clone for Linux and OSX. Git version."
arch=('x86_64')
url="https://github.com/eglaysher/rlvm"
license=('GPL-3.0-or-later')
depends=('boost-libs>=1.46' 'glew' 'libmad' 'libogg' 'libvorbis' 'libpng'
         'sdl_mixer' 'sdl_image' 'sdl_ttf' 'guichan' 'gtk3')
makedepends=('git' 'scons' 'boost')
provides=('rlvm')
conflicts=('rlvm')
source=("git+https://github.com/eglaysher/rlvm.git"
        "tests.patch"
        "warnings.patch"
        "gtk+3.patch")
sha256sums=('SKIP'
            'c22775cdf6f1cecee86047b0b0ed9d21c5d3425813a395fb2913e644064070bb'
            'dcbd9e0de8ccb91983d691f0b5fd6938fef45653ac20d244c1c19a3df01b7550'
            '6bf8a1d8cd64b05057859338132acef11db573c58adc3913679776b8d4a7b83a')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/tests.patch"
  patch -Np1 -i "$srcdir/warnings.patch"
  patch -Np1 -i "$srcdir/gtk+3.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  scons --release
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 build/release/rlvm "$pkgdir/usr/bin/rlvm"
  install -Dm644 debian/rlvm.6 "$pkgdir/usr/share/man/man6/rlvm.6"

  install -Dm644 src/platforms/gtk/rlvm.desktop "$pkgdir/usr/share/applications/rlvm.desktop"
  local _i
  for _i in 16 24 32 48 128 256; do
    install -Dm644 "resources/$_i/rlvm.png" "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/rlvm.png"
  done
  install -Dm644 resources/512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/rlvm.png"
}
