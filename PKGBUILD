pkgname=keyviz-wayland
pkgver=0.1.0
pkgrel=1
pkgdesc="Key visualization tool for Wayland (Tauri)"
arch=('x86_64')
url="https://github.com/notlimdev/keyviz-wayland"
license=('MIT')

depends=(
  webkit2gtk-4.1
  gtk3
  libayatana-appindicator
  librsvg
)

makedepends=(
  rust
  nodejs
  npm
  git
  cargo-tauri
)

source=(
  "keyviz-wayland::git+https://github.com/notlimdev/keyviz-wayland.git#tag=v$pkgver"
  "keyviz-wayland.desktop"
  "keyviz-wayland.png"
)

sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
  cd keyviz-wayland

  npm install
  npm run build   # solo frontend

  cargo tauri build --no-bundle
}

package() {
  cd keyviz-wayland/src-tauri/target/release

  install -Dm755 keyviz-wayland-tauri "$pkgdir/usr/bin/keyviz-wayland"

  # .desktop
  install -Dm644 "$srcdir/keyviz-wayland.desktop" \
    "$pkgdir/usr/share/applications/keyviz-wayland.desktop"

  # icono
  install -Dm644 "$srcdir/keyviz-wayland.png" \
    "$pkgdir/usr/share/pixmaps/keyviz-wayland.png"
}
