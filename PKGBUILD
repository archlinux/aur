# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Markus M. May <mmay@javafreedom.org>

_pkgname=vice
pkgname=$_pkgname-gnomeui-devel
pkgver=3.4
pkgrel=3
pkgdesc='Versatile Commodore Emulator (development release with the Gnome UI)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=('libpulse' 'giflib' 'vte3' 'gtk3' 'libpcap' 'mpg123' 'libieee1284' 'portaudio' 'pciutils' 'glew')
makedepends=('dos2unix' 'xorg-bdftopcf' 'xorg-mkfontdir' 'autoconf' 'xa' 'python')
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
  'notexi.patch'
)

sha512sums=(
  '3d42e7bbe15ec6efac918d11e354052048dac8efdeedc64bb724cb8aaf2dd8ec7a2fc176ddbc93722ce7c680f06d3966efc10587c24e9643238315ded025c4b8'
  '1433ed9e88f5eab34e53f89201df62c0c3a6aa4b61e6855823bb1ff833886a3058bdfeb9ea79c0f8658c2ec744314638524db6e0194783b4bf04d86824f19cdf'
  '702fa149f74158dbffe73b000ed7150a429176a66698293899662df220c68bcc233801aa281afc7353ebdbb7eaef395a9dacbf6d97f414f0dec5df5c1a997131'
  '6cc0e6f029750ead84f292dce9879f11b243266cf3787f96347cdd2d1193a74992c3dd63171af79d7f376d983e11a5dfc9327f27e2190de70f008ab81d4d93bb'
  'b996c044ff6a7b43a1b6ba2fd3f57ce68d4474902764e8b3f5d9c64e3730e6120e16d6d86b6c5e27513fac7b5d9449afcaf67e4c3014f2f535627648550f56aa'
  '33e544bbce2e559e71e9e8624af2a7ac00bd3578cc8f7aa5ef167f3fe5f6b000dd97306e85d49a8601f88bc1afa427f2143fcb0f339ced223b35f7468ac09e16'
)

prepare() {
  # Apply patches
  cd $_pkgname-$pkgver
  patch -Np1 -i ../no-fc-cache-no-lib64.patch
  patch -Np1 -i ../zlib-1.2.7.patch
  patch -Np1 -i ../notexi.patch

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

  # Install the help PDF
  install -Dm644 doc/$_pkgname.pdf "$pkgdir/usr/share/doc/vice/$_pkgname.pdf"

  # Link the docs folder to where Vice is expecting it to be
  ln -s /usr/share/doc/$_pkgname "$pkgdir/usr/lib/$_pkgname/doc"

  # Link the ttf font included with Vice to the system TTF fonts folder
  install -d "$pkgdir/usr/share/fonts/TTF"
  ln -s /usr/lib/$_pkgname/fonts/CBM.ttf "$pkgdir/usr/share/fonts/TTF/CBM.ttf"
}
