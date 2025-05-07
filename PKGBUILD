# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=sdlpop
pkgver=1.24rc1
_pkgver=1.24-RC
pkgrel=1
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later AND GPL-2.0-or-later AND (MIT OR Unlicense)')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2_image' 'sdl2_mixer')
source=("sdlpop-$pkgver.tar.gz::https://github.com/NagyD/SDLPoP/archive/v$_pkgver.tar.gz"
        "sdlpop.sh")
b2sums=('07e10e5f61e0f38e6d17baafb0a47951d5b19748c917dff67c8d94fdccefe843fef05db5aee2a12ac490f3e770771b604fd5225d549a84d07e201117ed721792'
        'eecce7df11ff08547fb79f3fdcfffaddb84c2c112f200f12d2bb748c0ac498bcb5e0ab42ecaff1420eca883d7d83e58a0c0ce54abcaceb645ca914c06e2bed10')

prepare() {
  cd SDLPoP-$_pkgver/src
  # shellcheck disable=SC2016 # the template just uses $ROOT
  sed -e 's|$ROOT|/opt/sdlpop|' SDLPoP.desktop.template > SDLPoP.desktop
}

build() {
  cd SDLPoP-$_pkgver/src
  export CFLAGS+=" $CPPFLAGS"
  make
}

package() {
  cd SDLPoP-$_pkgver
  # world-writable for save/load games, config, etc.
  install -dm757 "$pkgdir"/opt/sdlpop
  install -m755 prince "$pkgdir"/opt/sdlpop
  cp -r data doc mods SDLPoP.ini "$pkgdir"/opt/sdlpop
  install -Dm755 ../sdlpop.sh "$pkgdir"/usr/bin/prince
  install -Dm644 src/SDLPoP.desktop "$pkgdir"/usr/share/applications/sdlpop.desktop
}
