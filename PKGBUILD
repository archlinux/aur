# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=tlrc-git
_pkgname=tlrc
pkgver=v1.11.0.r1.g97359d0
pkgrel=1
pkgdesc='Official tldr client written in Rust.'
arch=('x86_64' 'aarch64')
url="https://github.com/tldr-pages/$_pkgname"
license=('MIT')
provides=('tldr')
conflicts=('tldr' 'tealdeer' 'tlrc' 'tlrc-bin')
makedepends=('git' 'cargo')
options=('!lto')
source=("git+https://github.com/tldr-pages/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

check() {
    cd $_pkgname

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --locked
}

build() {
  cd $_pkgname

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export COMPLETION_DIR=completions
  cargo build --release --frozen --locked
}

package() {
  cd $_pkgname

  install -Dm 755 "target/release/tldr" "$pkgdir/usr/bin/tldr"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 completions/tldr.bash "$pkgdir/usr/share/bash-completion/completions/tldr"
  install -Dm644 completions/_tldr -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 completions/tldr.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

