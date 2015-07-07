# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Markus M. May <mmay@javafreedom.org>

_pkgname=vice
pkgname=$_pkgname-gnomeui-devel
pkgver=2.4.20
pkgrel=2
pkgdesc='Versatile Commodore Emulator (development release with the Gnome UI)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=('libpulse' 'giflib' 'vte' 'gtkglext' 'libpcap')
makedepends=('dos2unix' 'xorg-bdftopcf' 'xorg-mkfontdir' 'autoconf')
options=('!makeflags')
install=$pkgname.install
conflicts=('vice' 'vice-ethernet' 'vice-gnome' 'vice-gnomeui' 'vice-gtkglext' 'vice-sdl' 'vice-svn' 'vice-2.2-gnomeui')

source=(
  "http://downloads.sourceforge.net/project/vice-emu/development-releases/$_pkgname-$pkgver.tar.gz"
  "$_pkgname.png"
  "$_pkgname.desktop"
  'x11video.patch'
  'no-fc-cache-no-lib64.patch'
  'zlib-1.2.7.patch'
  'notexi-notxt.patch'
)
sha512sums=(
  'a27b1672ca356d0e8f2890c91e449b78ef76512f6d81bdf25350b90c1f472d57ae6d23646d0176c5544c47d81023aa3deb172e3a02eeb0022ea32a13311b5a76'
  '1433ed9e88f5eab34e53f89201df62c0c3a6aa4b61e6855823bb1ff833886a3058bdfeb9ea79c0f8658c2ec744314638524db6e0194783b4bf04d86824f19cdf'
  'dc96b8658fac1a6f605b8f0052c11a5abb653da4b9deb3401d8b8177b14a664c0b3a5ed9e7c5c3013b0bc18b831045244f2f9187de9ff8b25b90f0b1cfa0cd8a'
  '77260d30312b44a50287cae55d57b5e8bfcee7b693ca87f206affff5bdc5d1717cc9260d4c9372a098c2b83028061222c36061d67559ba05859213cf640a9563'
  '0589c751a448caa3dd82cd667900d3cb35d718426423a4b2573a5ffba6ca9340849afb98d2a9fadb30f463a6fc7b24ef71bf2ea4ef2d5ad451709e424601216a'
  'd37544313037fa75971bab198b37d3824571a3e82d4e87bbe23b01d8a847fcf3f6652a23e4bc58cec6ae43deccc9322db2f77d046641b521f275e368aca940dd'
  '03c90e52d22545a7964b92df2286fa63014a4d5d20ae290196e9afa0a1bb04e1b94d81e3f4c969ed225c935db453499aee48068a56143091b98b77a9e55ec277'
)

prepare() {
  # Apply patches
  cd $_pkgname-$pkgver
  patch -Np1 -i ../x11video.patch
  patch -Np1 -i ../no-fc-cache-no-lib64.patch
  patch -Np1 -i ../zlib-1.2.7.patch
  patch -Np1 -i ../notexi-notxt.patch

  # Convert MS-DOS linebreaks to Unix style ones
  printf '%s ' 'Converting MS-DOS format linebreaks to Unix format...'
  while read -r; do
      dos2unix -q "$REPLY"
  done < <(find . -type f -regextype posix-egrep -regex '.*\.([ch]|in)$')
  printf '%s\n' 'DONE!'

  # Reconfigure the project build environment
  autoreconf -vi
}

build() {
  # Build the project
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-fullscreen \
              --enable-gnomeui \
              --enable-ethernet \
              --enable-memmap
  make
}

package() {
  # Install the XDG desktop file and icon
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # Install Vice
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" realdocdir=/usr/share/doc/$_pkgname install

  # Link the docs folder to where Vice is expecting it to be
  ln -s /usr/share/doc/$_pkgname "$pkgdir/usr/lib/$_pkgname/doc"

  # Link the ttf font included with Vice to the system TTF fonts folder
  install -d "$pkgdir/usr/share/fonts/TTF"
  ln -s /usr/lib/$_pkgname/fonts/CBM.ttf "$pkgdir/usr/share/fonts/TTF/CBM.ttf"
}

