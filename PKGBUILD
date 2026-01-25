# Maintainer: kmille <aur@androidloves.me>

_pkgname=cryptocam-companion-cli
pkgname="$_pkgname-git"
pkgver=r21.3056023
pkgrel=1
arch=('x86_64')
pkgdesc="CLI tool and to decrypt Cryptocam videos and manage keys"
url="https://gitlab.com/cryptocam/cryptocam-companion-cli"
license=('GPL-3.0-or-later')
depends=('ffmpeg')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'cargo' 'gcc' 'ffmpeg')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
   cd "$srcdir/$pkgname"
   export RUSTUP_TOOLCHAIN=stable
   cargo fetch --locked --target host-tuple
}

build() {
   cd "$srcdir/$pkgname"
   export RUSTUP_TOOLCHAIN=stable
   export CARGO_TARGET_DIR=target
   export CFLAGS+=' -ffat-lto-objects'
   cargo build --frozen --release --all-features
}

package() {
   cd "$srcdir/$pkgname"
   install -Dm0755 "target/release/cryptocam" "$pkgdir/usr/bin/$_pkgname"
}
