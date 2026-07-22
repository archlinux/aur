# Maintainer: yummiergravy <https://github.com/YummierGravy>

pkgname=plasma-lichess-tv-wallpaper-git
pkgver=0.1.0.r1.gbc08c45
pkgrel=1
pkgdesc="Unofficial Plasma 6 live wallpaper for Lichess TV (git)"
arch=('x86_64')
url="https://github.com/YummierGravy/plasma-lichess-tv-wallpaper"
license=('GPL-3.0-or-later' 'GPL-2.0-or-later' 'Apache-2.0')
depends=(
  'plasma-workspace'
  'kwin'
  'libplasma'
  'kirigami'
  'kconfig'
  'kcoreaddons'
  'kdbusaddons'
  'ki18n'
  'kpackage'
  'kwindowsystem'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
  'git'
)
provides=('plasma-lichess-tv-wallpaper' 'plasma6-lichess-tv-wallpaper')
conflicts=('plasma-lichess-tv-wallpaper' 'plasma6-lichess-tv-wallpaper' 'plasma6-lichess-tv-wallpaper-git')
source=("git+${url}.git")
sha256sums=('SKIP')
install=plasma-lichess-tv-wallpaper-git.install

pkgver() {
  cd plasma-lichess-tv-wallpaper
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S plasma-lichess-tv-wallpaper -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
