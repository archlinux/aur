# Maintainer: spider-mario <spidermario@free.fr>

pkgname=sdlpop
pkgver=1.20
pkgrel=1
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2_image' 'sdl2_mixer')
source=("sdlpop-$pkgver.tar.gz::https://github.com/NagyD/SDLPoP/archive/v$pkgver.tar.gz"
        "sdlpop.sh"
        "fix-build.patch")
b2sums=('4ebc83cf0b174db342ff5706ac08290be86d10e8e5a7dbcadbcf9eafede9d98f36baa03da400967c25cafda9df15483da3503cd6a75d4dc3b3b469ae43f8b0b0'
        'eecce7df11ff08547fb79f3fdcfffaddb84c2c112f200f12d2bb748c0ac498bcb5e0ab42ecaff1420eca883d7d83e58a0c0ce54abcaceb645ca914c06e2bed10'
        'ba657632ecb0667b8e706cad6d970dff85f3f81fccd36417d7363c94c3c1c99f30fa0b34c8f31976fdfb8eb660fa751aca2736ffa68293eca36f1bf4db3f3fb6')

prepare() {
  cd SDLPoP-$pkgver
  patch -p1 < ../fix-build.patch

  cd src
  sed -e 's|$ROOT|/opt/sdlpop|' SDLPoP.desktop.template > SDLPoP.desktop
}

build() {
  cd SDLPoP-$pkgver/src
  export CFLAGS+=" $CPPFLAGS"
  make
}

package() {
  cd SDLPoP-$pkgver
  # world-writable for save/load games, config, etc.
  install -dm757 "$pkgdir"/opt/sdlpop
  install -m755 prince "$pkgdir"/opt/sdlpop
  cp -r data doc mods SDLPoP.ini "$pkgdir"/opt/sdlpop
  install -Dm755 ../sdlpop.sh "$pkgdir"/usr/bin/prince
  install -Dm644 src/SDLPoP.desktop "$pkgdir"/usr/share/applications/sdlpop.desktop
}
