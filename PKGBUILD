# Maintainer: Aftershock9009 <cfsa9009 at gmail dot com>
_pkgname=itgmania
pkgname=$_pkgname-git
pkgver=0.8.0.r285.gb6a0813
pkgrel=1
pkgdesc="A fork of stepmania 5.1, improved for the post-ITG community, git beta branch"
provides=('itgmania')
conflicts=('itgmania')
arch=('x86_64')
url="https://www.itgmania.com/"
license=('MIT AND GPL-2.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND BSD-3-Clause AND CC-BY-NC-4.0')
depends=('mesa' 'glew' 'glu' 'udev' 'libx11' 'libxext' 'libxtst' 'libxinerama' 'libxrandr'
         'alsa-lib' 'libpulse' 'libmad' 'libjpeg' 'libusb-compat' 'libva' 'bzip2'
         'gtk3' 'jsoncpp' 'pcre')
makedepends=('git' 'cmake' 'nasm' 'llvm-libs')
source=("$pkgname"::"git+https://github.com/$_pkgname/$_pkgname.git#branch=beta")
options=("!lto")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$pkgname
  git  submodule update --init --recursive
}

build() {
  cd $pkgname/Build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/opt \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_FULL_RELEASE=YES \
    -DWITH_FFMPEG_JOBS=$(nproc) \
   -Wno-dev \
    ..
  make
}

package() {
  cd "$srcdir/$pkgname"
  make -C Build DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/itgmania/itgmania "$pkgdir/usr/bin/itgmania"
  install -Dm644 itgmania.desktop "$pkgdir/usr/share/applications/itgmania.desktop"

  install -Dm644 Docs/Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
}
