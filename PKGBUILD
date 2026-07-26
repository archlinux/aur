# Maintainer: bezau1 <your-email@example.com>
pkgname=vaultapp
pkgver=r2.9984ec5
pkgrel=1
pkgdesc="Local, encrypted (AES-256-GCM) notes vault — desktop app, no network access"
arch=('x86_64')
url="https://github.com/bezau1/vault-desktop"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'gdk-pixbuf2')
makedepends=('rust' 'nodejs' 'npm' 'git')
source=("git+https://github.com/bezau1/vault-desktop.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/vault-desktop"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/vault-desktop"
  export NO_STRIP=1
  npm install
  npm run tauri build -- --bundles deb
}

package() {
  cd "$srcdir/vault-desktop/src-tauri/target/release/bundle/deb"

  local debpkg
  debpkg=$(ls ./*.deb)

  # Extract the .deb's data archive straight into $pkgdir
  bsdtar -xO -f "$debpkg" data.tar.gz | bsdtar -xzf - -C "$pkgdir"
}
