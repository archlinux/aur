# Maintainer: Lucas Santos <hello@lsantos.dev>
# Builds the latest main. pkgver is recomputed by makepkg from git describe.
pkgname=opensynapse-git
pkgver=0.2.2
pkgrel=1
pkgdesc="Remap buttons, set DPI and lighting on Razer mice from Linux (latest main)"
arch=('x86_64' 'aarch64')
url="https://github.com/khaosdoctor/opensynapse"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'libxkbcommon' 'wayland' 'libglvnd')
optdepends=('xdg-desktop-portal: file picker for profile import/export in the GUI')
makedepends=('cargo' 'git')
provides=('opensynapse')
conflicts=('opensynapse')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features gui
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/opensynapse "$pkgdir/usr/bin/opensynapse"
  install -Dm755 target/release/opensynapse-gui "$pkgdir/usr/bin/opensynapse-gui"
  install -Dm644 udev/70-opensynapse.rules "$pkgdir/usr/lib/udev/rules.d/70-opensynapse.rules"
  install -Dm644 assets/opensynapse.desktop "$pkgdir/usr/share/applications/opensynapse.desktop"
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/opensynapse.svg"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/opensynapse.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/opensynapse/README.md"
  install -Dm644 PROTOCOL.md "$pkgdir/usr/share/doc/opensynapse/PROTOCOL.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/opensynapse/protocols" devices/protocols/*.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/completions/opensynapse.bash "$pkgdir/usr/share/bash-completion/completions/opensynapse"
  install -Dm644 contrib/completions/_opensynapse "$pkgdir/usr/share/zsh/site-functions/_opensynapse"
  install -Dm644 contrib/completions/opensynapse.fish "$pkgdir/usr/share/fish/vendor_completions.d/opensynapse.fish"
}
