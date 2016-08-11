# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the rbdoom3-bfg-git package by M0Rf30

pkgname=rbdoom-3-bfg
pkgver=1.0.3
pkgrel=5
pkgdesc="Doom 3 BFG source code (Robert Beckebans repo)."
arch=('i686' 'x86_64')
url="https://github.com/RobertBeckebans/RBDOOM-3-BFG"
license=('GPL3')
groups=('games')
depends=(doom3bfg-data ffmpeg glew openal sdl2)
makedepends=('cmake' 'zip')
conflicts=('rbdoom3-bfg-git')
optdepends=('alsa-plugins: pulseaudio-support'
            'libpulse: pulseaudio support')
source=("https://github.com/RobertBeckebans/RBDOOM-3-BFG/archive/${pkgver}.tar.gz"
        'rbdoom-3-bfg.desktop'
        '0001-Patch-from-Debian-803857-to-support-ffmpeg-2.9.patch')
sha256sums=('961182e741529c0a3634f1892d067b724ddd800cca936522c1d70415789e6bfb'
            'b05a261bd2fd4c1a32788d68397c98e17008d0636bc948edad51d2ebe29f5a8a'
            '1815f68da09bb67abc560fc1ef8e57a572d5b33b919102dc95d80e3369162929')

prepare() {
  cd "$srcdir/RBDOOM-3-BFG-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  mkdir "RBDOOM-3-BFG-$pkgver/build"
  cd "RBDOOM-3-BFG-$pkgver/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DOPENAL=1 -DSDL2=ON \
        -DUSE_SYSTEM_LIBGLEW=1 -DUSE_SYSTEM_LIBJPEG=1 \
        -DUSE_SYSTEM_ZLIB=1 -Wno-dev ../neo
  make
}

package() {
  cd "RBDOOM-3-BFG-$pkgver/build"

  install -Dm755 RBDoom3BFG "$pkgdir/usr/bin/RBDoom3BFG"
  install -Dm644 "../../rbdoom-3-bfg.desktop" "$pkgdir/usr/share/applications/rbdoom-3-bfg.desktop"
}
