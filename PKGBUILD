# Maintainer: redponike <proton (dot) me>
# Contributor: Snaporaz
# Contributor: Andrea Pelloni <apelloni@ethz.ch>

pkgname=python-symbolica
_pkgname=${pkgname#python-}
pkgver=0.16.0
pkgrel=2
pkgdesc="A blazing fast computer algebra system for Python and Rust"
arch=('x86_64')
url="https://github.com/benruijl/symbolica"
license=('LicenseRef:Symbolica')
conflicts=('python-symbolica-bin')
depends=('gmp' 'mpfr' 'python')
makedepends=('maturin' 'git' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3deb5f77b39a1ce4fd2a81c8716e845fd3c66bf4f56e590bec48d147ac7be839')

prepare() {
    cd "${_pkgname}-${pkgver}"
    
    # Patch Cargo.toml to force a rebuild of rug against the host's GMP/MPFR/MPC
    # Else there will be runtime errors for GMP symbols not found as GLIBC is newer on Arch
    # Symbolica, for now,  does not use rug::rand and rug::Complex so I didn't add them to features
    # Use gmp-mpfr-sys crate's experimental feature to force dynamic linking against the system's GMP/MPFR
    sed -i '/rug = "=1.25.0"/c\
rug = { version = "1.25.0", features = ["integer", "rational", "float", "std"], default-features = false }\
gmp-mpfr-sys = { version = "~1.6", features = ["use-system-libs"] }\
' Cargo.toml
}

build() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    RUST_BACKTRACE=1 maturin build --release --manylinux off --strip
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" target/wheels/*.whl
    install -Dm644 License.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
