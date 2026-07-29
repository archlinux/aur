# Maintainer: Andrew Shark <ashark on linuxcomp.ru>

pkgname=plasma6-runners-remmina-git
pkgver=0.1.r4.gbb740c3
pkgrel=1
pkgdesc='KRunner plugin for searching and launching Remmina profiles'
arch=('x86_64')
url='https://www.opencode.net/fpiecka/remmina-krunner-plugin'
license=('LGPL-2.1-or-later')
depends=('ki18n' 'krunner' 'qt6-base' 'remmina')
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "$pkgname"

  local basever
  basever="$(grep -Po '(?<=\"Version\": \")[^\"]+' src/remminarunner.json | head -n 1)"

  printf '%s.r%s.g%s' \
    "${basever:-0}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname/LICENSES/LGPL-2.1-or-later.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
