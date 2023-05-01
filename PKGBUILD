# Maintainer: Jef Roosens
# Contributor: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

_pkgname=scryer-prolog
pkgname=scryer-prolog-git
pkgver=0.9.1.r249.gc5a3ec3b
pkgrel=1
pkgdesc="A modern Prolog implementation written mostly in Rust (development version)"
arch=('aarch64' 'x86_64')
url="https://github.com/mthom/scryer-prolog"
license=('BSD-3-Clause')
depends=('openssl' 'libmpc' 'mpfr' 'gmp' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
source=("${_pkgname}::git+https://github.com/mthom/scryer-prolog" "fix-gmp-mpfr-sys.patch")
sha256sums=('SKIP'
            '5c42f0591d0fbfe5e403c3f2e24863f7932dacdfbf490defe7627c33fc248ff0')

pkgver() {
    git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"    

    # This patch is required because the gmp-mpfr-sys crate does not properly
    # compile. This patch tells the crate to use the system libraries instead.
    patch -p1 < "${srcdir}/fix-gmp-mpfr-sys.patch"
    cargo fetch
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release
}

check() {
    cd "${srcdir}/${_pkgname}"    
    cargo test --release
}

package() {
    cd "${srcdir}/${_pkgname}"

    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 target/release/scryer-prolog -t "${pkgdir}"/usr/bin
}
