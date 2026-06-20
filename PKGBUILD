# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=lore-vcs-git
pkgver=0.8.3.r30.gd57da2f
pkgrel=1
pkgdesc='Lore is a next-generation, open source version control system'
url='https://github.com/EpicGames/lore'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
arch=('x86_64')
conflicts=('lore-vcs')
provides=('lore-vcs')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  export LORE_BUILD_VERSION_NAME="aur"
  cargo build --frozen --release -p lore-client --bin lore
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/lore" "$pkgdir/usr/bin/lore"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  "$pkgdir/usr/bin/lore" completions bash >lore-completion-bash
  "$pkgdir/usr/bin/lore" completions zsh >lore-completion-zsh
  install -Dm644 lore-completion-bash "$pkgdir/usr/share/bash-completion/completions/lore"
  install -Dm644 lore-completion-zsh "$pkgdir/usr/share/zsh/site-functions/_lore"
}
