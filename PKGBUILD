# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: MatMoul <matmoul at the google email domain which is .com>
pkgname=octopi
pkgver=0.15.0+23+g8c508c91
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
  'inxi: for SysInfo log'
  'lsb-release: for SysInfo log'
  'mhwd: for SysInfo log'
  'pacaur: for AUR support'
  'pacmanlogviewer: to view pacman log files'
  'paru: for AUR support'
  'pikaur: for AUR support'
  'systemd: for SysInfo log'
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
_commit=8c508c91c8f4cc4923ea731a22261fa7d3be4ccb  # branch/master
source=("git+https://github.com/aarnt/octopi.git#commit=${_commit}")
sha256sums=('1bfbe5b403128209101b37f7b91a0c1eb5810dc496943b4d13326b26a41f99eb')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$pkgname"

  # Don't hardcode qt-sudo path
  sed -i 's/usr\/local/usr/g' src/constants.h
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

  # remove duplicate license
  rm -r "$pkgdir/usr/share/licenses"
}
