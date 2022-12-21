# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-blake3
pkgver=0.3.3
pkgrel=1
pkgdesc="Python bindings for the BLAKE3 cryptographic hash function"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/oconnor663/blake3-py"
license=('Apache' 'custom:CC0-1.0')

depends=('python')
makedepends=('python-pip' 'rust')

source=("blake3-py-${pkgver}.tar.gz"::"https://github.com/oconnor663/blake3-py/archive/${pkgver}.tar.gz")
sha512sums=('155d8165792935176bf9484b42d6caa715b3c6ff36d266be4d8334fc17a2fdd4a85c5c2c3d53285f21166232a8e558fe9340a8db2bd98ef01d0358809ed28dfb')

# NEON support on ARMv7 isn't universal and there's no runtime detection,
# so it should only be turned on when the hardware supports it.
ENABLE_NEON_ON_ARMv7=0

prepare() {
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
