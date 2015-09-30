# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=dhewm3-git
pkgver=r482.61d3efe
pkgrel=1
epoch=1
pkgdesc="Doom 3 engine with native 64-bit support, SDL, and OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/dhewm/dhewm3"
license=('GPL3')
depends=('doom3-data' 'libjpeg' 'libogg' 'libvorbis' 'openal' 'sdl')
makedepends=('cmake' 'git')
optdepends=('curl: download support')
source=("git+$url"
        'dhewm3.desktop'
        '0001-game_data_location.patch')
sha256sums=('SKIP'
            '7c9ae892c6cf0453fcd57731689ccedac8f8ce10f33043f7dd5fb66bd73d1287'
            'dbbb0607a92482a1b753cf9cac97dcc57345b92ee43449c9826f5b23af7624f9')

pkgver() {
  cd "${pkgname/-git/}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname/-git/}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "${pkgname/-git/}/neo"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DD3XP=1 -DDEDICATED=1 .
  make
}

package() {
  cd "${pkgname/-git/}/neo"

  make DESTDIR="$pkgdir" libdir="$pkgdir/usr/lib" install

  install -Dm644 "$srcdir"/dhewm3.desktop "$pkgdir/usr/share/applications/dhewm3.desktop"
}
