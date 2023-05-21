# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>
# Contributor: Jef Roosens

pkgname=scryer-prolog
pkgver=0.9.1
pkgrel=3
pkgdesc="An open source industrial strength production environment that is also a testbed for bleeding edge research in logic and constraint programming"
arch=('aarch64' 'x86_64')
url="https://github.com/mthom/scryer-prolog"
license=('BSD-3-Clause')
depends=('openssl' 'libmpc' 'mpfr' 'gmp' 'gcc-libs' 'glibc')
makedepends=('cargo')
source=("https://github.com/mthom/scryer-prolog/archive/refs/tags/v${pkgver}.tar.gz" "fix-gmp-mpfr-sys.patch")
sha256sums=('e69109af51f81568cec1137842cd438cb675f9fb966ba90b6a4ee85b469cd37d'
	    '253bd15e0c523a04b62098ad9484c01ed5539b82b2d55d0e10f9d5f353315ca5')

export CARGO_PROFILE_RELEASE_LTO="true"
export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
export CARGO_PROFILE_RELEASE_OPT_LEVEL="s"

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -s -p1 < "${srcdir}/fix-gmp-mpfr-sys.patch"
    cargo fetch --locked
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
