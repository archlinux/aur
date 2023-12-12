# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-blake3
pkgver=0.3.4
pkgrel=2
pkgdesc="Python bindings for the BLAKE3 cryptographic hash function"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/oconnor663/blake3-py"
license=('Apache' 'custom:CC0-1.0')

depends=('python')
makedepends=('python-pip' 'rust')

source=("blake3-py-${pkgver}.tar.gz"::"https://github.com/oconnor663/blake3-py/archive/${pkgver}.tar.gz")
sha512sums=('9b55249833c0066cc977b292d8e586175a5b3eb14b1619f2b402be960a65b189c8fdee9c5e7b3cfb44af2e588227c9864be1a95d486ad705a182253cae533c27')

# NEON support on ARMv7 isn't universal and there's no runtime detection,
# so it should only be turned on when the hardware supports it.
ENABLE_NEON_ON_ARMv7=0

prepare() {
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

package() {
    cd "blake3-py-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir/" --isolated --ignore-installed --no-deps --no-binary=blake3 --use-pep517 .
}
