# Maintainer: Phillip Davies <philliptdavies at gmail dot com>
pkgname=pros-cli
pkgver=3.5.6
pkgrel=5
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

    rm -f "$pkgdir/usr/bin/pros"

    UV_TOOL_DIR="$pkgdir/opt/pros-cli/uv-tools" \
        UV_TOOL_BIN_DIR="$pkgdir/usr/bin" \
        uv tool install "pros-cli==$pkgver" \
        --python /usr/bin/python3.10 \
        --with "setuptools<81" \
        --force

    # Patch utils.py to suppress the pkg_resources deprecation warning
    local utils_file
    utils_file="$pkgdir/opt/pros-cli/uv-tools/pros-cli/lib/python3.10/site-packages/pros/common/utils.py"

    if [[ ! -f "$utils_file" ]]; then
        error "Could not find PROS utils.py at $utils_file"
        return 1
    fi

    sed -i 's/^\(\s*\)import pkg_resources$/\1import warnings; warnings.filterwarnings("ignore", message="pkg_resources is deprecated as an API.*", category=UserWarning); import pkg_resources/' "$utils_file"

    # Replace uv-generated executable with a stable wrapper that includes the tool bin in PATH
    rm -f "$pkgdir/usr/bin/pros"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/pros" <<'EOF'
#!/bin/sh
export PATH="/opt/pros-cli/uv-tools/pros-cli/bin:$PATH"
exec /opt/pros-cli/uv-tools/pros-cli/bin/python -m pros.cli.main "$@"
EOF

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
