# Maintainer: El-Mundos <taber.nandez.sergio@gmail.com>
pkgname=spotatui-git
pkgver=0.35.5.r3.ga3ee518
pkgrel=1
pkgdesc="A Spotify client for the terminal written in Rust, powered by Ratatui (git version)"
arch=('x86_64')
url="https://github.com/LargeModGames/spotatui"
license=('MIT')
depends=('openssl' 'pipewire')
makedepends=('cargo' 'clang' 'git')
provides=('spotatui')
conflicts=('spotatui' 'spotatui-bin')
options=('!lto')
source=("$pkgname::git+https://github.com/LargeModGames/spotatui.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

prepare() {
  cd "$pkgname"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_PROFILE_RELEASE_LTO=false
  cd "$pkgname"
  # Strip LTO flags to prevent libspa-sys wrapper symbol being dropped
  export RUSTFLAGS="${RUSTFLAGS//-Clto=*/} -Clto=no"
  export CFLAGS="${CFLAGS//-flto*/}"
  export CXXFLAGS="${CXXFLAGS//-flto*/}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/spotatui" "$pkgdir/usr/bin/spotatui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install and fix desktop file
  if [ -f "snap/gui/spt.desktop" ]; then
      install -Dm644 "snap/gui/spt.desktop" "$pkgdir/usr/share/applications/spotatui.desktop"
      sed -i 's/Exec=spt/Exec=spotatui/' "$pkgdir/usr/share/applications/spotatui.desktop"
      sed -i '/Icon=/d' "$pkgdir/usr/share/applications/spotatui.desktop"
  fi
}
