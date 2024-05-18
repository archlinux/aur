# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: MatMoul <matmoul at the google email domain which is .com>
pkgname=octopi
pkgver=0.15.0+19+ga081ac2b
pkgrel=1
pkgdesc="A powerful Pacman frontend using Qt libs"
arch=('x86_64')
url="https://tintaescura.com/projects/octopi"
license=('GPL-2.0-or-later')
depends=(
  'alpm-octopi-utils'
  'qt-sudo'
  'qt6-5compat'
  'qtermwidget'
)
makedepends=(
  'cmake'
  'git'
  'qt6-tools'
)
optdepends=(
  'pacaur: for AUR support'
  'pacmanlogviewer: to view pacman log files'
  'paru: for AUR support'
  'pikaur: for AUR support'
  'trizen: for AUR support'
  'yay: for AUR support'
)
provides=(
  'octopi-notifier'
  'octopi-repoeditor'
  'octopi-cachecleaner'
)
conflicts=(
  'octopi-notifier'
)
replaces=(
  'octopi-notifier-qt5'
  'octopi-notifier-frameworks'
)
_commit=a081ac2bfd0564be64348f9a3a74ac9f4952bee1  # branch/master
source=("git+https://github.com/aarnt/octopi.git#commit=${_commit}")
sha256sums=('60250c4d6d638e8e3e4692a1397020411b00f1eb187f648d7a3420658e1942df')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$pkgname"

  # Add missing cmake_minimum_required command
  sed -i '1 i\cmake_minimum_required(VERSION 3.5)' notifier/CMakeLists.txt

  # Don't hardcode qt-sudo path
  sed -i 's/usr\/local/usr/g' src/constants.h

  # why doesn't upstream just do this so we don't have to...
  cp -f "resources/images/${pkgbase}_green.png" "resources/images/${pkgbase}.png"
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_QTERMWIDGET6='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
