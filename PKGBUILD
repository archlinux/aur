# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Markus M. May <mmay@javafreedom.org>

_pkgname=vice
pkgname=$_pkgname-gnomeui-devel
pkgver=3.3
pkgrel=2
pkgdesc='Versatile Commodore Emulator (development release with the Gnome UI)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=('libpulse' 'giflib' 'vte3' 'gtk3' 'libpcap' 'mpg123' 'libieee1284' 'portaudio' 'pciutils')
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
  'no-fc-cache-no-lib64.patch'
  'zlib-1.2.7.patch'
  'notexi-notxt.patch'
)

sha512sums=(
  '702942e33b6e3d7e29ca6ed483242319ed5f6be26831def88a282cf7dce25d4c34dbf3651fcf8b583492fcb280ce5f4304c6eda3712088a73db24772c7a2bb3a'
  '1433ed9e88f5eab34e53f89201df62c0c3a6aa4b61e6855823bb1ff833886a3058bdfeb9ea79c0f8658c2ec744314638524db6e0194783b4bf04d86824f19cdf'
  'dc96b8658fac1a6f605b8f0052c11a5abb653da4b9deb3401d8b8177b14a664c0b3a5ed9e7c5c3013b0bc18b831045244f2f9187de9ff8b25b90f0b1cfa0cd8a'
  'fc93c4917624bdee2c3b86acc8a36ddf2cfdbd69e89dff4907771c66c4457ee499dfb76a49e603474a12c9f84d0561a0b1b4b7ae82a9034b57dd0bb977770d13'
  'b97fc172f4092675f13866ec208b12b494a4a1c35d535fe1e5d2c69bbc62b6d19df922fc7086c1878071d67ac2aa70920d1469b48a898a89c41b58ba053f73bd'
  '25537f0e433d3b7a403adeb4efad48d29c869bf90a38de2868b3324240a63c6927f43cb0246e35b9b669bc1d02f17ebbcb77f51aeae7ff78071c9a412fd9e1cb'
)

prepare() {
  # Apply patches
  cd $_pkgname-$pkgver
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
  ./configure --prefix=/usr --enable-native-gtk3ui --enable-ethernet
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
