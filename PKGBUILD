# Maintainer: Phillip Davies <philliptdavies at gmail dot com>
pkgname=pros-cli
pkgver=3.5.6
pkgrel=3
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('any')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f9095e68ceea4ca783c425ecb90da7a58f2870797e190997365ebd4f14f0986c')

depends=('arm-none-eabi-newlib' 'arm-none-eabi-gcc' 'clang')
makedepends=('uv')

package() {
    cd "$pkgname-$pkgver"

    # Use uv to install pros-cli into an isolated environment under pkgdir
    UV_TOOL_DIR="$pkgdir/opt/pros-cli/uv-tools" \
        UV_TOOL_BIN_DIR="$pkgdir/usr/bin" \
        uv tool install "pros-cli==$pkgver" \
        --python 3.10 \
        --with "setuptools<81"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/pros" <<'EOF'
#!/bin/sh
PYTHONWARNINGS="ignore:pkg_resources is deprecated as an API:UserWarning" \
exec /opt/pros-cli/uv-tools/pros-cli/bin/pros "$@"
EOF
}
