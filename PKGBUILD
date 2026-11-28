# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=pinch-git
pkgver=0.2.0.r64.geca5cfa
pkgrel=1
pkgdesc='Small, fast screenshot tool with annotations (development build)'
arch=('x86_64')
url='https://github.com/ufna/pinch'
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'wayland' 'kstatusnotifieritem' 'noto-fonts' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'glibc')
makedepends=('cmake' 'qt6-tools' 'git')
checkdepends=('dbus')
provides=("pinch=$pkgver")
conflicts=('pinch' 'pinch-bin')
source=("pinch::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pinch"
  local version
  version=$(sed -nE 's/^project\(pinch VERSION ([0-9]+\.[0-9]+\.[0-9]+) .*/\1/p' CMakeLists.txt)
  [[ -n $version ]] || return 1
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$srcdir/pinch" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPINCH_WERROR=OFF
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/pinch/LICENSE" "$pkgdir/usr/share/licenses/pinch/LICENSE"
}
