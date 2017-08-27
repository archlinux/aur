# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the rbdoom3-bfg-git package by M0Rf30

pkgname=rbdoom-3-bfg
_commit=e5b3c697d23b9a90c654181162fe476c8c4f90d9
pkgver=1.1.0preview3.r98.e5b3c697
pkgrel=2
pkgdesc="Doom 3 BFG source code (Robert Beckebans repo)."
arch=('i686' 'x86_64')
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
        'rbdoom-3-bfg.desktop'
        20-reproducible.patch
        30-init-sdl2.patch
        40-libpng16.patch
        50-system-rapidjson.patch
        60-spelling-errors.patch
        70-disable-hdr-by-default.patch
        80-gcc7.patch)
sha512sums=('3773935aa7684dca0e1f310f8c23afc61000d5bb9e579361df9113c0be12e5e1f5b5af4719461a0b6868ddb47a7e84d812b494a14e8993a0cf3f5d60a3094a8a'
            'f1a74a79c369bec1c371eb74f7e8c415b4d1993fae995b0e476eb7c7e3b0a42dfb8ee5ae1f2e960c1443603f36abe37409ffeac0c29fd085ef5045388ff905f8'
            'db8c51b9bcdb35e81bdc8c5a0ba2575060948ed2fb9837f92cfb9ff73b5f709d8f0909b12cc7715d72dad91cf79d769fd27817c8442bf642af967b1d237974fd'
            'c60b508f5f5c3e19a0ef2431b3d2119b405e8f610356a98c931c16a53ac1b319c485ebe9d454b884a6d66829573377e3f94220bc50dc70efde45c9312f172859'
            'efd74dacb3cdd28b7d78b348e884de0e23170908504f32f1dad2ded81c49a1c7e3b0f80da4fca96c14e52c4aeb2c4591a5877ada81ea2fcd3ab9e59b78d3989e'
            'f7ca60ca455be6cfc7a1367edc3850a97b701e3f3d34ebe67d7f8a2b5412d5006fc7554712147cba450d7de0b4fab18a4eb292ca88272dc4ecc3a9462428bc16'
            'bc1f8bf5ae2025d776080ec41496a16c3e09b1737d4f1c1f76bddb48f97a394dda3ba1f6e08ac8c5d8731a4acc5212a43f90daf41ba7d0f50f8dba5dc18b1069'
            '6cdf1650709a85cc96a57bc1e6fa127fa6b25ac980984a9f60f77daf4a761589a41eaff61fd7ca9946218a20edd835f4fb28d9844cbac8e6b28769ff149e6dec'
            '884ac7ae61b780042b012bbc1d702260533768edc466572dd6b35568966e1d837d7d6a43e77e7b1f7405b71871d55971d3d236df19f59110b8fa39e18b5b4b9f')

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
