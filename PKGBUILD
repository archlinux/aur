# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=infomaniak-dyndns-wildcard-git
_name=infomaniak-dyndns-wildcard
pkgver=v1.0.1.r0.ge39bf47
pkgrel=1
pkgdesc='A dynamic DNS client for wildcard domain on Infomaniak'
url='https://github.com/Its-Alex/infomaniak-dyndns-wildcard'
license=('MIT')
makedepends=('git' 'cargo')
depends=('ca-certificates' 'openssl')
arch=('x86_64')
provides=('infomaniak-dyndns-wildcard')
validpgpkeys=('D1AC5180F5837E1CD69D6CA2D13067073B9A98A9')
source=("$_name::git+$url.git"
        "env"
        "service")
b2sums=()

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_name"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_name"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$_name/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_name/README.md"
  install -Dm600 env "$pkgdir/etc/conf.d/$_name"
  install -Dm600 service "$pkgdir/etc/conf.d/$_name.service"
}
