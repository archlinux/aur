# Maintainer: darkprof <dark_prof@mail.ru>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sdl_sound-hg_daum
pkgver=1.0.1.r135.2df1f5c62d38
pkgrel=1
pkgdesc="A library to decode several popular sound file formats (version for dosbox-daum)"
arch=('i686' 'x86_64')
url="http://icculus.org/SDL_sound/"
license=('LGPL')
depends=('sdl' 'libmodplug' 'libvorbis' 'flac' 'speex')
makedepends=('mercurial')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=(${pkgname%-*}::"hg+http://hg.icculus.org/icculus/SDL_sound#revision=2df1f5c62d38"
        "${pkgname%-*}-renamed-physfs-export.patch")
sha256sums=('SKIP'
            'd7bd96390d9bc877c0204922c7c4666cadfdccc5e6c0cfcf9477d113377f5d10')

pkgver() {
  cd ${pkgname%-*}

  _version_major=$(grep SOUND_VER_MAJOR SDL_sound.h | tr -cd [:digit:])
  _version_minor=$(grep SOUND_VER_MINOR SDL_sound.h | tr -cd [:digit:])
  _version_patch=$(grep SOUND_VER_PATCH SDL_sound.h | tr -cd [:digit:])
  _version="$_version_major.$_version_minor.$_version_patch"
  _commits=$(hg log --template "{node}\n" -r release-$_version:stable-1.0 | wc -l)
  _hash=$(hg identify -i | tr -cd [:alnum:])
  printf "%s.r%s.%s" "${_version}" "$_commits" "$_hash"
}

prepare() {
  # fix deprecated physfs declaration
  patch -d ${pkgname%-*} -Np1 < ${pkgname%-*}-renamed-physfs-export.patch
}

build() {
  cd ${pkgname%-*}

  ./bootstrap
  ./configure --prefix=/usr --disable-static --disable-mikmod
  make
}

package() {
  make -C ${pkgname%-*} DESTDIR="$pkgdir/" install
}
