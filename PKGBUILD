# Maintainer: Laura Demkowicz-Duffy <laura at demkowiczduffy dot co dot uk>
_pkgname=jj-spr
pkgname=$_pkgname-git
pkgver=r149.8f2eb88
pkgrel=3
pkgdesc="Jujutsu github stacked prs"
arch=('x86_64')
url="https://github.com/LucioFranco/jj-spr"
license=('MIT')
depends=('jujutsu' 'zlib' 'glibc' 'gcc-libs' 'libgit2')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')
# libgit2-sys (as configured in this package) and ring won't compile reliably with LTO
# see https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --frozen --all-features
  cargo test --test '*' --frozen --all-features
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 target/release/jj-spr "$pkgdir/usr/bin/jj-spr"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CHANGELOG.md

  cp -rv docs "$pkgdir/usr/share/doc/$pkgname"
}
