# Maintainer: cestella <cestella@users.noreply.github.com>

pkgname=qtspot-git
pkgver=rolling.r94.g99906a0
pkgrel=1
pkgdesc='Fast, native Spotify client (Qt 6 / QML)'
arch=('x86_64' 'aarch64')
url='https://github.com/YummierGravy/qtspot'
license=('MIT')
depends=('alsa-lib' 'dbus' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'openssl' 'qt6-base' 'qt6-declarative')
makedepends=('cargo' 'cmake' 'git' 'pkgconf' 'qt6-base' 'qt6-declarative')
provides=('qtspot')
conflicts=('qtspot')
options=('!lto')
source=('qtspot::git+https://github.com/YummierGravy/qtspot.git')
sha256sums=('SKIP')

pkgver() {
  cd qtspot

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd qtspot
  cargo fetch --locked
}

build() {
  cd qtspot
  export CARGO_PROFILE_RELEASE_LTO=false
  cargo build --frozen --release -p qtspot-gui --bin qtspot
}

package() {
  cd qtspot

  install -Dm755 target/release/qtspot "$pkgdir/usr/bin/qtspot"
  install -Dm644 .pkg/qtspot.desktop "$pkgdir/usr/share/applications/qtspot.desktop"
  install -Dm644 assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/qtspot.svg"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
