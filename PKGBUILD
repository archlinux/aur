# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-mommy-git
pkgver=r10.df726f2
pkgrel=1
pkgdesc="Mommy's here to support you when running cargo~"
url='https://github.com/Gankra/cargo-mommy'
license=('Apache' 'MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("$pkgname::git+https://github.com/Gankra/cargo-mommy.git"
        "0001-multiple-toolchain.patch::https://github.com/Gankra/cargo-mommy/pull/18.patch")
sha256sums=('SKIP'
            'b6e24f80d82e08069917c5ea28b02dca2786396960a18aca574b14989d567a21')
b2sums=('SKIP'
        '26e978f4a2a63666db67066c2738df3e37bbf32ef79751783fce1042d4927a04c06aca448d5f2244d368ca5657124bf9e19269e995424b38ccdcf8c3b7ea81ff')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

pkgver() {
  cd "$pkgname"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$pkgname"

  git apply \
    "$srcdir/0001-multiple-toolchain.patch"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/cargo-mommy
}
