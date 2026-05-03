# Maintainer: arthurr0 <koeckiartur@gmail.com>
pkgname=mterminal-git
_pkgname=mterminal
pkgver=0.1.0.r0.gHEAD
pkgrel=1
pkgdesc="Custom terminal emulator with grouped tabs and warm dark UI"
arch=('x86_64')
url="https://github.com/arthurr0/mTerminal"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
)
makedepends=(
  'git'
  'rust'
  'nodejs'
  'pnpm'
  'pkgconf'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/arthurr0/mTerminal.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.g%s' \
    "$(grep '^version' src-tauri/Cargo.toml | head -1 | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  pnpm install --frozen-lockfile
}

build() {
  cd "$_pkgname"
  export WEBKIT_DISABLE_DMABUF_RENDERER=1
  pnpm tauri build --no-bundle
}

package() {
  cd "$_pkgname"

  install -Dm755 "src-tauri/target/release/$_pkgname" \
    "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "packaging/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 "src-tauri/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
