# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: qwak <qwak@w8.pl>
# Contributor: ThatGuyJon <theonereddragon@gmail.com>

pkgname=lib32-sdl_mixer
pkgver=1.2.12
pkgrel=2
pkgdesc="A simple multi-channel audio mixer (32 bit)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_mixer/release-1.2.html"
license=('custom')
depends=("${pkgname#*-}" 'lib32-sdl>=1.2.12' 'lib32-libvorbis' 'lib32-libmikmod' 'lib32-smpeg')
makedepends=('gcc-multilib' 'lib32-fluidsynth')
optdepends=('lib32-fluidsynth: MIDI software synth, replaces built-in timidity')
source=("http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-$pkgver.tar.gz"
        "$pkgname-mikmod1.patch"
        "$pkgname-mikmod2.patch"
        "$pkgname-fluidsynth-volume.patch"
        "$pkgname-double-free-crash.patch")
sha256sums=('1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a'
            'e0d36cd81083a0b033436b8f300cc4f4513a6043e57fea139afbade02dbe0de8'
            'a0c5326b4363464159a38dc51badad984b65ce0fa4c3b1dd1ad5f73bc7b6c55e'
            '4b6c567debf18c88398d4045a6e4ed0954f0e04cc61162ca907a83ddec17cd70'
            'b707f5c8d1229d1612cc8a9f4e976f0a3b19ea40d7bd1d5bc1cbd5c9f8bca56d')

prepare() {
  cd SDL_mixer-$pkgver

  patch -Np1 <../$pkgname-mikmod1.patch
  patch -Np1 <../$pkgname-mikmod2.patch
  patch -Np1 <../$pkgname-fluidsynth-volume.patch
  patch -Np1 <../$pkgname-double-free-crash.patch

  sed -e "/CONFIG_FILE_ETC/s|/etc/timidity.cfg|/etc/timidity++/timidity.cfg|" \
    -e "/DEFAULT_PATH/s|/etc/timidity|/etc/timidity++|" \
    -e "/DEFAULT_PATH2/s|/usr/local/lib/timidity|/usr/lib/timidity|" \
    -i timidity/config.h
}

build() {
  cd SDL_mixer-$pkgver

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  make -C SDL_mixer-$pkgver DESTDIR="$pkgdir/" install

  # remove header file
  rm -rf "$pkgdir"/usr/include

  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s ${pkgname#*-} "$pkgdir"/usr/share/licenses/$pkgname
}
