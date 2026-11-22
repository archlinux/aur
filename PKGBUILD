# Maintainer: Phillip Davies <philliptdavies at gmail dot com>
pkgname=pros-cli
pkgver=3.5.6
pkgrel=4
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('any')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f9095e68ceea4ca783c425ecb90da7a58f2870797e190997365ebd4f14f0986c')

depends=('python310' 'arm-none-eabi-newlib' 'arm-none-eabi-gcc' 'clang')
makedepends=('uv')

package() {
    cd "$pkgname-$pkgver"

    # Clean up potentially stale entry points from previous builds
    rm -f "$pkgdir/usr/bin/pros"

    UV_TOOL_DIR="$pkgdir/opt/pros-cli/uv-tools" \
        UV_TOOL_BIN_DIR="$pkgdir/usr/bin" \
        uv tool install "pros-cli==$pkgver" \
        --python /usr/bin/python3.10 \
        --with "setuptools<81" \
        --force

    # Remove uv-generated executables and replace with a stable wrapper
    rm -f "$pkgdir/usr/bin/pros"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/pros" <<'EOF'
#!/bin/sh
exec /opt/pros-cli/uv-tools/pros-cli/bin/python -m pros.cli.main "$@"
EOF

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
