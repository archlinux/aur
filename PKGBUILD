# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=scriptorium
pkgver=0.0.2
pkgrel=1
pkgdesc="Note-taking application"
arch=('x86_64')
url="https://github.com/athanclark/scriptorium"
license=('GPL-3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'pnpm')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('045aee5d68af3acbeaf7f3fa5ba2602cd28ec010cbd2d5c9535333287312303d')  # Replace with real checksum
options=(!lto !strip)   # avoid post-build strip and LTO for safety

build() {
  cd "$srcdir/$pkgname-$pkgver"
  pnpm install --frozen-lockfile
  # export CARGO_PROFILE_RELEASE_LTO="off"   # or "false"
  # export RUSTFLAGS="${RUSTFLAGS//-Clto=*}" # scrub any -Clto from env
  # export RUSTFLAGS="$RUSTFLAGS -Clinker-plugin-lto=no"
  pnpm tauri build --no-bundle
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/scriptorium" \
    "$pkgdir/usr/bin/scriptorium"
}
