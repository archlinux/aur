# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=psfu
pkgver=0.5.1
pkgrel=1
pkgdesc="process fu"
arch=('x86_64' 'i686')
url="https://github.com/idiv-biodiversity/$pkgname"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/idiv-biodiversity/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ba02b889855846fbfcaf06bcf0e8aca4')

prepare() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  export RUSTUP_TOOLCHAIN=stable

  cargo test --frozen --all-features
}

package() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  # shellcheck disable=2154
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  find target -name '*.bash$'

  install \
    -Dm644 \
    "$(find target -name $pkgname.bash)" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  install \
    -Dm644 \
    "$(find target -name $pkgname.elv)" \
    "$pkgdir/usr/share/elvish/lib/$pkgname.elv"

  install \
    -Dm644 \
    "$(find target -name $pkgname.fish)" \
    "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

  install \
    -Dm644 \
    "$(find target -name _$pkgname)" \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
