# Maintainer: CharOfString <root@charofstring.cc>

pkgname=ptre-git
_pkgname=ptre
pkgver=0.1.6.1.r0.g83563ec
pkgrel=1
pkgdesc='Lightweight text editor'
arch=('x86_64' 'aarch64')
url='https://github.com/CharOfString/ptre'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("git+$url.git")
sha256sums=('SKIP')

_cargo() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo "$@" --manifest-path "$srcdir/$_pkgname/Cargo.toml"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  _cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  _cargo build --frozen --release
}

check() {
  _cargo test --frozen --release
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/target/release/$_pkgname"
}
