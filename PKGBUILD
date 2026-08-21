# Maintainer: Arjix <me@arjix.dev>
# Maintainer: cilgin <cilgincc@outlook.com>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
pkgname=vicinae-git
pkgver=0.26.3.r2.gbe7cdf0
pkgrel=1
pkgdesc="A focused launcher for your desktop — native, fast, extensible"
arch=('x86_64' 'aarch64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(
  'nodejs'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'layer-shell-qt'
  'libqalculate'
  'qtkeychain-qt6'
  'syntax-highlighting'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'npm'
  'glaze'
  'wayland-protocols'
  'qt6-shadertools'
  'qt6-tools'
  'cmark-gfm'
)
install=vicinae-git.install
provides=("vicinae")
conflicts=("vicinae")
source=("git+${url}.git" "vicinae.hook")
sha256sums=('SKIP'
            'e9697f260d8d848090d0585fd7d29b8a7344964a8d1dfaa0409df260500de864')

pkgver() {
  cd "${pkgname%-git}" || exit
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}" || exit
  cmake -G Ninja -B build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${pkgname%-git}" || exit
  DESTDIR="$pkgdir" cmake --install build

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-git}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-git}.hook"
}
