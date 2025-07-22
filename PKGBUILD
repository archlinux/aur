# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: envolution
# Contributor: mnussbaum
# Contributor: j.r <j.r@jugendhacker.de>

pkgname=rot8-git
_pkgname="rot8"
pkgver=1.0.0+r112+g428221ea0
pkgrel=1
pkgdesc="A screen rotation daemon "
arch=("x86_64" "aarch64")
url="https://github.com/efernau/rot8"
license=("MIT")
makedepends=("git" "rust" "cargo")
source=("$_pkgname::git+https://github.com/efernau/rot8.git")
sha256sums=('SKIP')
provides=("rot8")
conflicts=("rot8")

pkgver(){
  cd "${srcdir}/${_pkgname}"
  _version=$(git tag --sort=-v:refname --list | head -n1 | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 "$srcdir/$_pkgname/target/release/rot8" "$pkgdir/usr/bin/rot8"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et: