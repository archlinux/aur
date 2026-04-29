# Maintainer: cestella <cestella@users.noreply.github.com>

pkgname=spotix-git
pkgver=rolling.r78.gf156614
pkgrel=1
pkgdesc='Fast and native Spotify client'
arch=('x86_64' 'aarch64')
url='https://github.com/skyline69/spotix'
license=('MIT')
depends=('alsa-lib' 'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'openssl' 'pango')
makedepends=('cargo' 'clang' 'git' 'pkgconf')
provides=('spotix')
conflicts=('spotix')
options=('!lto')
source=('spotix::git+https://github.com/skyline69/spotix.git')
sha256sums=('SKIP')

pkgver() {
  cd spotix

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd spotix
  cargo fetch --locked
}

build() {
  cd spotix
  export CARGO_PROFILE_RELEASE_LTO=false
  export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-fuse-ld=bfd"
  cargo build --frozen --release -p spotix-gui --bin spotix
}

package() {
  cd spotix

  install -Dm755 target/release/spotix "$pkgdir/usr/bin/spotix"
  install -Dm644 .pkg/spotix.desktop "$pkgdir/usr/share/applications/spotix.desktop"
  install -Dm644 assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/spotix.svg"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
