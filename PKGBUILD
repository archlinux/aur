# Maintainer: MartianInGreen <git@rennersh.de>
pkgname=pacinspect
pkgver=0.1.0
pkgrel=1
pkgdesc='AI-assisted security review gate for AUR PKGBUILDs'
arch=('x86_64' 'aarch64')
url='https://github.com/MartianInGreen/Pacinspect'
license=('MIT')
depends=('git' 'glibc')
makedepends=('cargo')
optdepends=('yay: inspect complete AUR transactions before makepkg runs')
options=('!lto' '!debug')
_source_ref=v0.1.0
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_source_ref.tar.gz")
sha256sums=('73f9fdb8697c477e747ad39b5971802551a15627ab518e0dfb157c0ac60c48db')

_cargo_env() {
  if [[ ! -v _pacinspect_rustflags_base ]]; then
    _pacinspect_rustflags_base=${RUSTFLAGS:-}
  fi
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="$_pacinspect_rustflags_base --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname-$pkgver"
}

prepare() {
  cd "Pacinspect-${_source_ref#v}"
  _cargo_env
  cargo fetch --locked
}

build() {
  cd "Pacinspect-${_source_ref#v}"
  _cargo_env
  cargo build --frozen --release
}

check() {
  cd "Pacinspect-${_source_ref#v}"
  _cargo_env
  cargo test --frozen --release
}

package() {
  cd "Pacinspect-${_source_ref#v}"
  install -Dm755 target/release/pacinspect "$pkgdir/usr/bin/pacinspect"
  ln -s pacinspect "$pkgdir/usr/bin/pacinstall"
  ln -s pacinstall "$pkgdir/usr/bin/pac"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
