# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=dhewm3-git
pkgver=20120703
pkgrel=1
pkgdesc="Doom 3 engine with native 64-bit support, SDL, and OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/dhewm/dhewm3"
license=('GPL3')
depends=('doom3-data' 'libjpeg' 'libogg' 'libvorbis' 'openal' 'sdl')
makedepends=('cmake' 'git')
optdepends=('curl: download support')
install=dhewm3.install
source=('dhewm3.desktop'
        '0001-game_data_location.patch')
sha256sums=('7c9ae892c6cf0453fcd57731689ccedac8f8ce10f33043f7dd5fb66bd73d1287'
            '285b91bd3ec936382f21a5b047256d730dfea7a6a9ee30bfb5a99d3d41060d3a')

_gitroot=git://github.com/dhewm/dhewm3.git
_gitname=dhewm3

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_gitname"
  patch -p1 < "$srcdir"/0001-game_data_location.patch

  cd neo
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DD3XP=1 -DDEDICATED=1 .
  make
}

package() {
  cd "$srcdir/$_gitname/neo"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/dhewm3.desktop "$pkgdir"/usr/share/applications/dhewm3.desktop
}
