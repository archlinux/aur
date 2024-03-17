# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>
# Contributor: Jef Roosens

pkgname=scryer-prolog
pkgver=0.9.4
pkgrel=1
pkgdesc="An open source industrial strength production environment that is also a testbed for bleeding edge research in logic and constraint programming"
arch=('aarch64' 'x86_64')
url="https://github.com/mthom/scryer-prolog"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!strip' '!lto')
source=(
    "https://github.com/mthom/scryer-prolog/archive/refs/tags/v${pkgver}.tar.gz"
    "update-crates.patch"
)
sha256sums=(
    'ccf533c5c34ee7efbf9c702dbffea21ba1c837144c3592a9e97c515abd4d6904'
    '13979b0d53a8e7171e5b90f3958a492f9c70232971bb6b5691e4542c546ac0e0'
)

export CARGO_PROFILE_RELEASE_LTO="false"
export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
export CARGO_PROFILE_RELEASE_OPT_LEVEL=2 # revert back to "s" if it's too big

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/update-crates.patch"
    cargo fetch # --locked
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname-$pkgver"    
    cargo test --release --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 target/release/scryer-prolog -t "$pkgdir"/usr/bin
}
