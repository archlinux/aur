# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Kyle McLamb <alloyed@tfwno.gf>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Contributor: dreeze, bageljr, pio, caffineetim
pkgname=love10
pkgver=0.10.2
pkgrel=4
pkgdesc="2D game engine which uses the versatile Lua scripting language"
arch=(i686 x86_64)
url="http://love2d.org/"
license=('zlib')
depends=('luajit' 'physfs' 'freetype2' 'mpg123' 'openal' 'libvorbis' 'libmodplug' 'sdl2')
source=("https://github.com/love2d/love/archive/refs/tags/$pkgver.tar.gz")
md5sums=('dae522353f40300ad30799517b4ccdc6')
provides=('love')
makedepends=('git')

prepare() {
  cd "$srcdir/love-$pkgver/platform/unix"

  # Update version information in configure script
  sed -i 1s/HEAD/$pkgver/ configure.ac

  # Skip installing desktop files, icons, etc
  sed -i 4q Makefile.am

  # Fix for the latest version of lua
  find "$srcdir/love-$pkgver/src/libraries/luasocket/libluasocket/" \
       -type f -print0 | xargs -0 sed -i "s/luaL_reg/luaL_Reg/g"
}

build() {
  cd "$srcdir/love-$pkgver"

  # Generate a configure script, then configure
  echo "Generating makefiles"
  sh platform/unix/automagic 10 # this number names executable and library
  ./configure --enable-silent-rules --prefix=/usr LDFLAGS=""

  # Finally build
  echo "Building"
  make
}

package() {
  cd "$srcdir"/love-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm0644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
