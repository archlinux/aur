# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=dhewm3-git
pkgver=2013.09.17.g6d8108c
pkgrel=2
pkgdesc="Doom 3 engine with native 64-bit support, SDL, and OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/dhewm/dhewm3"
license=('GPL3')
depends=('doom3-data' 'libjpeg' 'libogg' 'libvorbis' 'openal' 'sdl')
makedepends=('cmake' 'git')
optdepends=('curl: download support')
install=dhewm3.install
source=('git+https://github.com/dhewm/dhewm3.git'
        'dhewm3.desktop'
        '0001-game_data_location.patch'
        '0002-find_basepath_correctly.patch')
sha256sums=('SKIP'
            '7c9ae892c6cf0453fcd57731689ccedac8f8ce10f33043f7dd5fb66bd73d1287'
            'dbbb0607a92482a1b753cf9cac97dcc57345b92ee43449c9826f5b23af7624f9'
            '41ea4db22a8a884a2ce9b6c8e68dc2e0364a02528eda2bec81e4a90b9c322557')

pkgver() {
  cd "${pkgname/-git/}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "${pkgname/-git/}"
  patch -p1 < "$srcdir"/0001-game_data_location.patch
  patch -p1 < "$srcdir"/0002-find_basepath_correctly.patch

  cd neo
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DD3XP=1 -DDEDICATED=1 .
  make
}

package() {
  cd "${pkgname/-git/}/neo"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/dhewm3.desktop "$pkgdir"/usr/share/applications/dhewm3.desktop
}
