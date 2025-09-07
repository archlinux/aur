# Maintainer: ikolan
# Contributors: carstene1ns, jose riha, Christoph Zeiler, nut543 and Dany Martineau

pkgname=cdogs
pkgver=2.3.2
sdl2_mixer_ver=2.8.1
pkgrel=1
pkgdesc='Enhanced SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('gtk3' 'sdl2_image')
makedepends=('cmake' 'python-pip' 'python-protobuf')
optdepends=('cdogs-mission-pack: A large collection of user-created campaigns for C-Dogs.')
source=(
    cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/${pkgver}.tar.gz"
    "https://github.com/libsdl-org/SDL_mixer/releases/download/release-${sdl2_mixer_ver}/SDL2_mixer-${sdl2_mixer_ver}.tar.gz"
)
sha256sums=('e2f56262629b175d4a387f6491696edc0a5b9420c9be8e9aa12b60feaa4fefa1'
            'cb760211b056bfe44f4a1e180cc7cb201137e4d1572f2002cc1be728efd22660')

prepare() {
  cd $pkgname-sdl-$pkgver

  # disable -Werror (aborts build on mere warnings)
  sed 's| -Werror||' -i CMakeLists.txt

  # Replace SDL2_mixer dynamic linking by static linking
  sed "s|include_directories(src src/cdogs)|include_directories(src src/cdogs ${srcdir}/SDL2_mixer-${sdl2_mixer_ver}/include)|" -i "${srcdir}/cdogs-sdl-${pkgver}/CMakeLists.txt"
  sed "s|find_package(SDL2_mixer REQUIRED)||" -i "${srcdir}/cdogs-sdl-${pkgver}/CMakeLists.txt"
  sed "s|SDL2_mixer::SDL2_mixer|${srcdir}/SDL2_mixer-${sdl2_mixer_ver}/build/.libs/libSDL2_mixer.a|" -i "${srcdir}/cdogs-sdl-${pkgver}/src/cdogs/CMakeLists.txt"
  sed "s|SDL2_mixer::SDL2_mixer|${srcdir}/SDL2_mixer-${sdl2_mixer_ver}/build/.libs/libSDL2_mixer.a|" -i "${srcdir}/cdogs-sdl-${pkgver}/src/cdogsed/CMakeLists.txt"
}

build() {
  # Building SDL2_mixer for linking it staticly with ogg-stb features enabled.
  # This is due to a bug with ogg-vorbis enabled causing the game to crash at boot.
  # https://github.com/cxong/cdogs-sdl/issues/852#issuecomment-2067648775
  cd "SDL2_mixer-${sdl2_mixer_ver}"

  sed -i "s|/etc/timidity.cfg|/etc/timidity/timidity.cfg|g" src/codecs/music_timidity.c

  ./configure \
      --enable-music-ogg-stb \
      --enable-music-flac-libflac \
      --enable-music-mp3-mpg123 \
      --disable-music-ogg-vorbis \
      --disable-music-flac-drflac \
      --disable-music-mp3-drmp3 \
      --prefix=/usr
  make

  cd ../$pkgname-sdl-$pkgver

  cmake ./ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/share/cdogs \
    -DCDOGS_DATA_DIR="/usr/share/cdogs/"
  make
}

package() {
  make DESTDIR="$pkgdir/" install -C $pkgname-sdl-$pkgver
  mv $pkgdir/usr/share/cdogs/bin/ $pkgdir/usr/bin/
  mv $pkgdir/usr/share/cdogs/share/* $pkgdir/usr/share/
}
