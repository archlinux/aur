# Maintainer: aquabeam <laithbahodi@gmail.com>

pkgname=xshot-git
pkgver=r12.b84afb1
pkgrel=2
pkgdesc='XS Screenshot Tool for X11'
arch=('x86_64')
url=https://github.com/hydrobeam/xshot
license=('MIT')
depends=('libxcb' 'libx11')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=(SKIP)

# If there are no tags then use number of revisions since beginning of the history: 
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cargo fetch --locked --manifest-path=$pkgname/Cargo.toml --target="$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked

  find target -name xshot.fish | xargs dirname > out_dir
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked
}

package() {
  cd "$pkgname"

  local OUT_DIR=$(<out_dir)

  install -Dm755 "target/release/xshot" "$pkgdir/usr/bin/xshot"

  install -Dm644 "$OUT_DIR/_xshot" "$pkgdir/usr/share/zsh/site-functions/_xshot"
  install -Dm644 "$OUT_DIR"/xshot.bash "$pkgdir/usr/share/bash-completion/completions/xshot"
  install -Dm644 "$OUT_DIR"/xshot.fish "$pkgdir/usr/share/fish/vendor_completions.d/xshot.fish"
  install -Dm644 "$OUT_DIR"/xshot.1 "$pkgdir/usr/share/man/man1/xshot.1"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

