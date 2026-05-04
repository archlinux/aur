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
  'gtk3'
  'nss'
  'libnotify'
  'libxss'
  'libxtst'
  'alsa-lib'
)
makedepends=(
  'git'
  'nodejs'
  'pnpm'
  'python'
  'base-devel'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/arthurr0/mTerminal.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.g%s' \
    "$(node -p "require('./package.json').version")" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  pnpm install --frozen-lockfile
  pnpm exec electron-rebuild -f -w node-pty
}

build() {
  cd "$_pkgname"
  pnpm package:linux
}

package() {
  cd "$_pkgname"

  local appimage
  appimage=$(find release -maxdepth 2 -type f -name '*.AppImage' | head -n1)
  install -Dm755 "$appimage" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "packaging/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 "build/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
