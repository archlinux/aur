# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Markus M. May <mmay@javafreedom.org>

_pkgname=vice
pkgname=$_pkgname-gnomeui-devel
pkgver=2.4.32
pkgrel=1
pkgdesc='Versatile Commodore Emulator (development release with the Gnome UI)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=('libpulse' 'giflib' 'vte' 'gtkglext' 'libpcap' 'mpg123' 'libieee1284' 'portaudio' 'pciutils')
makedepends=('dos2unix' 'xorg-bdftopcf' 'xorg-mkfontdir' 'autoconf')
options=('!makeflags')
install=$pkgname.install
provides=("$_pkgname")
conflicts=("$_pkgname")

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
  '4cabafc254d6c578458c41c5c6682f71b8be37da72ce563c4df09a18c11da92d24d89ebf13092f46f723f901574c03bf0ce1b2c04e55c7e00a381cc346ac5f5e'
  '1433ed9e88f5eab34e53f89201df62c0c3a6aa4b61e6855823bb1ff833886a3058bdfeb9ea79c0f8658c2ec744314638524db6e0194783b4bf04d86824f19cdf'
  'dc96b8658fac1a6f605b8f0052c11a5abb653da4b9deb3401d8b8177b14a664c0b3a5ed9e7c5c3013b0bc18b831045244f2f9187de9ff8b25b90f0b1cfa0cd8a'
  '076e684ecac402ccb014faebe5eaab5bb46e9e9caca9ba23374ddf94a1c83172b0874343e449c91186763114d0f388dac0060afd831bdc9eceffc6cf3529c58d'
  '2706f179cdc6fb4f86198f532dccbe520dce2676238c69013af5303055f94ed44d6b8ec50cd55c47b0bf8b46f3af260767466db728f00fe409281232c8d0165e'
  'd37544313037fa75971bab198b37d3824571a3e82d4e87bbe23b01d8a847fcf3f6652a23e4bc58cec6ae43deccc9322db2f77d046641b521f275e368aca940dd'
  'd7637b0604490f1792dde1083211d418b850ecbeaf688b3013913c5af7e752796fe8d45c8306b7a1593b62c028c9def7bf04e81bc0187d05cd464727f0c5645a'
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
  ./configure --prefix=/usr --enable-fullscreen --enable-gnomeui --enable-ethernet --enable-memmap
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
