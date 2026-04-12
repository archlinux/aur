pkgname=inspectors-desktop-git
epoch=1
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc='Linux-first Tauri operator app for the Agent Computer Use Platform'
arch=('x86_64' 'aarch64')
url='https://github.com/OneNoted/inspectors'
license=('MIT')
depends=('glib-networking' 'gtk3' 'libsoup3' 'nodejs>=22' 'webkit2gtk-4.1')
makedepends=('cargo' 'git' 'pkgconf')
provides=('inspectors-desktop')
conflicts=('inspectors-desktop')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  local base_version
  base_version=$(sed -n '/^\[workspace.package\]/,/^\[/s/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)
  base_version=${base_version//-alpha./alpha}
  base_version=${base_version//-beta./beta}
  base_version=${base_version//-rc./rc}
  base_version=${base_version//-/.}

  printf '%s.r%s.g%s\n' \
    "$base_version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked --package desktop-app --bin inspectors-desktop
}

check() {
  cd "$srcdir/$pkgname"
  cargo test --locked --package desktop-app
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/inspectors-desktop "$pkgdir/usr/bin/inspectors-desktop"
  install -Dm644 crates/desktop-app/packaging/inspectors.desktop \
    "$pkgdir/usr/share/applications/inspectors.desktop"
  install -Dm644 crates/desktop-app/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/inspectors.png"
}
