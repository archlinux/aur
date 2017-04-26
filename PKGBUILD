# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Markus M. May <mmay@javafreedom.org>

_pkgname=vice
pkgname=$_pkgname-gnomeui-devel
pkgver=3.1
pkgrel=1
pkgdesc='Versatile Commodore Emulator (development release with the Gnome UI)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=('libpulse' 'giflib' 'vte' 'gtk3' 'libpcap' 'mpg123' 'libieee1284' 'portaudio' 'pciutils')
makedepends=('dos2unix' 'xorg-bdftopcf' 'xorg-mkfontdir' 'autoconf')
options=('!makeflags')
install=$pkgname.install
provides=("$_pkgname")
conflicts=("$_pkgname")

# Release type (toggle to development-release again once they move ahead of the release)
_release='releases'
# _release='development-releases'

source=(
  "http://downloads.sourceforge.net/project/vice-emu/$_release/$_pkgname-$pkgver.tar.gz"
  "$_pkgname.png"
  "$_pkgname.desktop"
  'x11video.patch'
  'no-fc-cache-no-lib64.patch'
  'zlib-1.2.7.patch'
  'notexi-notxt.patch'
)

sha512sums=(
  'bc02a3597a17dadb37c487e6942192c0e9dc1a7d4e440fbf0dc8a165dbb2dee60ddf157697a020d2780ddef56a0a67802768d5c6d117b9cf5cdc124de45bc579'
  '1433ed9e88f5eab34e53f89201df62c0c3a6aa4b61e6855823bb1ff833886a3058bdfeb9ea79c0f8658c2ec744314638524db6e0194783b4bf04d86824f19cdf'
  'dc96b8658fac1a6f605b8f0052c11a5abb653da4b9deb3401d8b8177b14a664c0b3a5ed9e7c5c3013b0bc18b831045244f2f9187de9ff8b25b90f0b1cfa0cd8a'
  '849b4a42b331fcd3133e78d6116ea4416e2de45afd698f3ad0a8e94ef4117085e0b2bb756ed4720bfedbcb6b0ed72a8195b338e1fada0a9a105819a87e61cc5e'
  '1a9f5dbfc0593a01ae64825fc13623fe601620fcb2cd3e98f7fdda73ff7e0dc22b20b8ce56aecd5bebf3da5121f0ee3ef1201d203edd8783ebda31a6f6ac1aac'
  'd37544313037fa75971bab198b37d3824571a3e82d4e87bbe23b01d8a847fcf3f6652a23e4bc58cec6ae43deccc9322db2f77d046641b521f275e368aca940dd'
  '399b732462d5f0a1edef16c31d223ec9b99f428f1cd21ca2dd9548c9ffeab2aab6c3576c600b1da7499f78a69cb2077202c4d64fac6fd903966681e21db6692d'
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
  ./configure --prefix=/usr --enable-fullscreen --enable-gnomeui3 --enable-ethernet
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
