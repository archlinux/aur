# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the rbdoom3-bfg-git package by M0Rf30

pkgname=rbdoom-3-bfg
_commit=3f7cf5387d887b44ed9cf7786f090b7b761550e8
pkgver=1.2.0
pkgrel=1
pkgdesc="Enhanced Doom 3: BFG Edition engine"
arch=('x86_64')
url="https://github.com/RobertBeckebans/RBDOOM-3-BFG"
license=('GPL3')
groups=('games')
depends=(doom3bfg-data ffmpeg glew libpng openal sdl2)
makedepends=(cmake rapidjson zip)
conflicts=('rbdoom3-bfg-git')
install=rbdoom-3-bfg.install
optdepends=('alsa-plugins: pulseaudio-support'
            'libpulse: pulseaudio support')
source=("https://github.com/RobertBeckebans/RBDOOM-3-BFG/archive/${_commit}.tar.gz"
        rbdoom-3-bfg.desktop
        20-reproducible.patch
        40-libpng16.patch
        60-spelling-errors.patch
        80-gcc7.patch
        90-fix-include-path.patch)
sha512sums=('85e7165295e23a70859168f4ede3730ceb490535dccd011e1adfb1879c528be4f1b83a3506caece3b32a3923bf7a4862c9a9968ef006b4230ae1c58d40e063e2'
            'f1a74a79c369bec1c371eb74f7e8c415b4d1993fae995b0e476eb7c7e3b0a42dfb8ee5ae1f2e960c1443603f36abe37409ffeac0c29fd085ef5045388ff905f8'
            'f76d82dd92ef85c381c597578556019d624c6da70f5487072f2069604866fb2d067681ec8d48de1ad890289d452d6f0ee3c659105b31ac67dea41943f22b4767'
            'efd74dacb3cdd28b7d78b348e884de0e23170908504f32f1dad2ded81c49a1c7e3b0f80da4fca96c14e52c4aeb2c4591a5877ada81ea2fcd3ab9e59b78d3989e'
            '20cf661f8ad4dc06d1e4ffe3d2f63bae3d1e2002618e58d5a05f027d15a87ba7e47c2ef14ce5c98e18d759ff76d9e144767195200fa78983f12505a93d739beb'
            '5b473c8fa55c53d57044e0a1713443f2012c8e88e7f6349eb9e81f482e6ca958b501e95c88f55cac74dca84b3c015414617dfdb159c08d17d134543d7da5dc74'
            'd30f418f19608d94251cb2076c7c38e08ed6f19f0db55b0646c5119fc645f6ebe9d6ac4ee1183e3959ad75d70c33027226f39cb588681599f5874ea557c990e4')

prepare() {
  cd "$srcdir/RBDOOM-3-BFG-$_commit"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  mkdir "RBDOOM-3-BFG-$_commit/build"
  cd "RBDOOM-3-BFG-$_commit/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr   \
        -DOPENAL=ON                   \
        -DSDL2=ON                     \
        -DUSE_SYSTEM_LIBGLEW=ON       \
        -DUSE_SYSTEM_LIBJPEG=ON       \
        -DUSE_SYSTEM_LIBPNG=ON        \
        -DUSE_SYSTEM_RAPIDJSON=ON     \
        -DUSE_SYSTEM_ZLIB=ON          \
        -DUSE_PRECOMPILED_HEADERS=OFF \
        -Wno-dev ../neo
  make
}

package() {
  cd "RBDOOM-3-BFG-$_commit/build"

  install -Dm755 RBDoom3BFG "$pkgdir/usr/bin/RBDoom3BFG"
  install -Dm644 "../../rbdoom-3-bfg.desktop" "$pkgdir/usr/share/applications/rbdoom-3-bfg.desktop"
  ln -s RBDoom3BFG "$pkgdir/usr/bin/rbdoom3bfg"
}
