# Maintainer: Jose Riha <jose1711 at gmail dot com>
# Contributor: John Faust <contact at yayponies dot eu>
# Contributor: fhilg
# Contributor: skunk
# Contributor: Mitmischer

pkgname=ultrastardx-git
pkgver=r949.16331ad4
pkgrel=1
pkgdesc='Free and open source karaoke game. (GIT)'
arch=('i686' 'x86_64')
url="http://usdx.eu/"
license=('GPL')
depends=('ffmpeg' 'lua' 'portaudio' 'sdl2' 'sdl2_gfx' 'sdl2_mixer' 'sdl2_net'
         'sdl2_ttf' 'sdl2_image' 'ttf-dejavu' 'gnu-free-fonts' 'wqy-microhei' 'portmidi'
         'pkg-config' 'autoconf' 'automake')
makedepends=('git' 'fpc' 'gendesk')
optdepends=('ultrastar-creator: Qt program to generate USDX songs'
            'ultrastardx-songs: Free songs for USDX'
            'ultrastardx-utility: Manage USDX songs')
#options=('!libtool')
provides=('ultrastardx')
conflicts=('ultrastardx')
groups=('usdx')
source=("git://github.com/UltraStar-Deluxe/USDX.git" "avcodec.patch")

sha256sums=('SKIP'
            'fbe1e5e887bc235fef71c6d0f6ff26b7c377bb92cbeecd6a81d6ecb354ade84f')

pkgver() {
  cd "${srcdir}/USDX"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/USDX"
  patch -p1 -i "${srcdir}/avcodec.patch"
  ./autogen.sh
}


build() {
  cd "${srcdir}/USDX"
  ./configure --prefix=/usr --enable-debug
  make LDFLAGS="-O1 --sort-common --as-needed -z relro"
  gendesk -f -n --pkgname ultrastardx --name "UltraStar Deluxe" --exec "ultrastardx" --pkgdesc "Karaoke game" --categories 'Games'
}

package() {
  cd "${srcdir}/USDX"
  touch COPYING.txt
  make DESTDIR="$pkgdir/" install
  install -Dm644 "ultrastardx.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/USDX/game/resources/icons/ultrastardx-icon.png" "${pkgdir}/usr/share/pixmaps/ultrastardx.png"
}
