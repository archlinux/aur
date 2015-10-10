# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=dhewm3
pkgver=1.4.0
pkgrel=1
pkgdesc="Doom 3 engine with native 64-bit support, SDL, and OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/dhewm/dhewm3"
license=('GPL3')
depends=('doom3-data' 'libjpeg' 'libogg' 'libvorbis' 'openal' 'sdl')
makedepends=('cmake')
optdepends=('curl: download support')
source=("$url/archive/$pkgver.tar.gz"
        'dhewm3.desktop'
        '0001-game_data_location.patch')
sha256sums=('b579cd2d07d4efc0ebb536c933857ee28a302d9e9484ebd5bda9b40f8da17f88'
            '7c9ae892c6cf0453fcd57731689ccedac8f8ce10f33043f7dd5fb66bd73d1287'
            'dbbb0607a92482a1b753cf9cac97dcc57345b92ee43449c9826f5b23af7624f9')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver/neo"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DD3XP=1 -DDEDICATED=1 .
  make
}

package() {
  cd "$pkgname-$pkgver/neo"

  make DESTDIR="$pkgdir" libdir="$pkgdir/usr/lib" install
  install -Dm644 "$srcdir"/dhewm3.desktop "$pkgdir/usr/share/applications/dhewm3.desktop"
}
