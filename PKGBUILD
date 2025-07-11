# Maintainer: Joaquim Monteiro <joaquim dot monteiro at protonmail dot com>

pkgname=python-blake3
pkgver=1.0.5
pkgrel=1
pkgdesc="Python bindings for the BLAKE3 cryptographic hash function"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/oconnor663/blake3-py"
license=('Apache-2.0' 'CC0-1.0')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-maturin' 'rust')

source=("blake3-py-${pkgver}.tar.gz"::"https://github.com/oconnor663/blake3-py/archive/${pkgver}.tar.gz")
sha512sums=('006d716fcf088a8a64188d79324e2fbef00d41b66cd7292cb0d94496d7397297f49e1cb33cf120ec76d40a93a01594e494df44433d83f83b48169677f41a6536')

# NEON support on ARMv7 isn't universal and there's no runtime detection,
# so it should only be turned on when the hardware supports it.
ENABLE_NEON_ON_ARMv7=0

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo 'ERROR: $VIRTUAL_ENV is set, which means the build is running in a virtual Python environment.'
        echo 'ERROR: Rerun the build in a fresh terminal, using the default/system Python environment.'
        exit 1
    fi
    if [[ $CARCH = 'aarch64' || ( "$CARCH" = 'armv7h' && "$ENABLE_NEON_ON_ARMv7" -ne 0 ) ]]; then
        cd "blake3-py-${pkgver}"
        echo -e '[tool.maturin]\ncargo-extra-args = "--features neon"' >> pyproject.toml
    fi
}

build() {
    cd "blake3-py-${pkgver}"
    [[ -d dist/ ]] && rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "blake3-py-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
