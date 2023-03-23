# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=flatwaifu
_pkgver_base=1.35
pkgver=1.35.r197.a46dd0e
pkgrel=1
pkgdesc="Doom-themed platformer by Prikol Software, a modern port made by DeaDDooMER"
arch=(x86_64 i686)
url="https://doom2d.org/"
license=('GPL3')
depends=(doom2d-res sdl2 openal libgl)
makedepends=(git cmake gcc)
provides=(doom2d)
conflicts=(doom2d-rembo doom2d-vcd)
source=(
  'git://repo.or.cz/flatwaifu.git'
  'd2d.1.gz'
  'doom2d.desktop'
  'doom2d.png'
  'doom2d.sh'
  'local-cfg-write.patch'
)
noextract=(
  'd2d.1.gz'
)
md5sums=(
  'SKIP'
  '5d02fd2f50a6de16dc5e4bdfaae494bd'
  '045e4e63fdcc5f6dddb7cc396eab16ee'
  '9e3f78a5f7d779b4050bc7e7659822f4'
  '0c92ce494d887acf4e9199368d9b2456'
  '2c06d1f7119043eef2ad35f79e9fc668'
)
options=(
  !strip
)
install=doom2d.install

pkgver() {
  cd "$srcdir"/flatwaifu
  printf "$_pkgver_base.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"

  # Patching cfg writing, because we executing binary from root directory
  patch -uN flatwaifu/src/sdl2/main.c local-cfg-write.patch || return 1

  cd flatwaifu/src
   mkdir build 
   cd build
   cmake -DSYSTEM_DRIVER=SDL2 -DRENDER_DRIVER=OPENGL -DSOUND_DRIVER=OPENAL ..
   make
}


package() {
  cd "$srcdir"/flatwaifu/src/build
  install -Dm755 doom2d "$pkgdir"/usr/bin/doom2d
  
  cd ../../..
  install -Dm644 doom2d.desktop "$pkgdir"/usr/share/applications/doom2d.desktop
  install -Dm644 doom2d.png "$pkgdir"/usr/share/pixmaps/doom2d.png
  install -Dm755 doom2d.sh "$pkgdir"/usr/share//doom2d/doom2d.sh
  install -Dm644 d2d.1.gz "$pkgdir"/usr/share/man/man1/d2d.1.gz
}
