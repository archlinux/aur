# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sdl_sound-patched-hg
pkgver=1.0.3.r48.719dade41745
pkgrel=1
pkgdesc="A library to decode several popular sound file formats, patched for SDL2, pkg-config and ima-adpcm support (development version)"
arch=('i686' 'x86_64')
url="http://icculus.org/SDL_sound/"
license=('LGPL')
depends=('sdl2' 'libmodplug' 'libvorbis' 'flac' 'speex')
makedepends=('mercurial')
conflicts=("${pkgname%%-*}")
provides=("${pkgname%%-*}")
source=(${pkgname%%-*}::"hg+http://hg.icculus.org/icculus/SDL_sound"
        "${pkgname%%-*}-pkgconfig.patch"
        "${pkgname%%-*}-ima-adpcm.patch"
        "${pkgname%%-*}-renamed-physfs-export.patch")
sha256sums=('SKIP'
            'c2ebc5487c678ca4d77f5530a01c14602b9794861f4f75a1097fe47f9a8bd7ff'
            'b3a58c1db0281192d129832971b8912467ee88d67cc926b8fa8738b621f48fd7'
            'd7bd96390d9bc877c0204922c7c4666cadfdccc5e6c0cfcf9477d113377f5d10')

pkgver() {
  cd ${pkgname%%-*}

  _lasttag=$(hg tags -q | sort -r | grep release- | head -n1)
  _commits=$(hg log --template "{node}\n" -r $_lasttag:tip | wc -l)
  printf "%s.r%s.%s" "${_lasttag/release-}" "$_commits" "$(hg identify -i)"
}

prepare() {
  cd ${pkgname%%-*}

  # fix deprecated physfs declaration
  patch -Np1 < ../${pkgname%%-*}-renamed-physfs-export.patch
  # patch for SDL2 and pkgconfig support
  patch -Np1 < ../${pkgname%%-*}-pkgconfig.patch
  # patch for ima-adpcm support
  patch -Np1 < ../${pkgname%%-*}-ima-adpcm.patch
}

build() {
  cd ${pkgname%%-*}

  ./bootstrap
  ./configure --prefix=/usr --disable-static --disable-mikmod
  make
}

package() {
  make -C ${pkgname%%-*} DESTDIR="$pkgdir/" install
}
