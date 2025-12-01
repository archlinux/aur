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
backup=('etc/conf.d/infomaniak-dyndns-wildcard')
validpgpkeys=('D1AC5180F5837E1CD69D6CA2D13067073B9A98A9')
source=("$_name::git+$url.git?signed"
        "env"
        "service")
b2sums=('SKIP'
        'a8fd4f4d98fa8124b5d5ac96bd78761a032da73c9b384e50995ec6b0d93c57120cc6f42aa33f246c32fe932c7639948964f82d8c6fed54941eba92bb10d9e5b2'
        'c9662e910cca1efdd7679dbe5c651bf408dde209d44c9ba01b620dfbd9e2531c8f46e55b2a389a024930d691e8d9f203d5dc01e5040e40c768967186ba1a7292')

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
  install -Dm600 $srcdir/env "$pkgdir/etc/conf.d/$_name"
  install -Dm644 $srcdir/service "$pkgdir/usr/lib/systemd/system/$_name.service"
}
