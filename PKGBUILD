# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
pkgname=dot-manager-git
_repo=DotManager
_cmd=dot-manager
pkgver=0.3.1.r0.g4115e17
pkgrel=1
pkgdesc="CLI Utility for easy dotfile management"
arch=("x86_64")
url="https://github.com/WithoutAName25/$_repo"
license=("MIT")
depends=("gcc-libs" "glibc")
makedepends=("cargo" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./')"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 "target/release/$_cmd" "$pkgdir/usr/bin/$_cmd"

  install -Dm644 "target/generated/completions/$_cmd.bash" "$pkgdir/usr/share/bash-completion/completions/$_cmd"
  install -Dm644 "target/generated/completions/$_cmd.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_cmd.fish"
  install -Dm644 "target/generated/completions/_$_cmd" "$pkgdir/usr/share/zsh/site-functions/_$_cmd"

  for file in target/generated/manpage/"$_cmd"*.1; do
    install -Dm644 "$file" "$pkgdir/usr/share/man/man1/$(basename "$file")"
    gzip "$pkgdir/usr/share/man/man1/$(basename "$file")"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
