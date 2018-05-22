# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Markus M. May <mmay@javafreedom.org>

_pkgname=vice
pkgname=$_pkgname-gnomeui-devel
pkgver=3.2
pkgrel=1
pkgdesc='Versatile Commodore Emulator (development release with the Gnome UI)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=('libpulse' 'giflib' 'vte' 'gtk3' 'libpcap' 'mpg123' 'libieee1284' 'portaudio' 'pciutils')
makedepends=('dos2unix' 'xorg-bdftopcf' 'xorg-mkfontdir' 'autoconf' 'xa')
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
  'd05081db90e2ee85745ecdee0b692a5c485b76b21a56463b17639de29c29c6deda3c39504122d8440f1667156d11dad504cea76b9b0272fc770ccfe0da3df616'
  '1433ed9e88f5eab34e53f89201df62c0c3a6aa4b61e6855823bb1ff833886a3058bdfeb9ea79c0f8658c2ec744314638524db6e0194783b4bf04d86824f19cdf'
  'dc96b8658fac1a6f605b8f0052c11a5abb653da4b9deb3401d8b8177b14a664c0b3a5ed9e7c5c3013b0bc18b831045244f2f9187de9ff8b25b90f0b1cfa0cd8a'
  '9d5625a7ed63d9908d778cecfe077ae238137894d82029c11144bc4986e92e69472dea3530cf18535ad72d2f5eec04f92d68a9b58ea3a99d1dd65a9c703662cd'
  '568360097d382886a046cb43f046db18180d5fa3ca04a1205334e05891fa6b649a5c767e68dd2087ec70aab7595b2d01182da77589e4c507407ee3bd694c9803'
  'cc5a0a8967d5532de0b0948ebd95f3aa69136ffc0aea4efc736b6dcef68f750d6103871acd41d18fac3828f412944d9f2d7f040825d5d6e7aacce24f43329de6'
  '8f7d6ca165dee7f4cad53ddcc64c63236a5fbd1541e9eeaca3fde00a1133ee938b656d9a238934fd0170555d301fd81b9e67c7f6338a061628364e56dee1fff1'
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
  ./configure --prefix=/usr --enable-fullscreen --enable-native-gtk3ui --enable-ethernet
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
