# Maintainer: Zine Yu zine.xlws@gmail.com

pkgname=buck2-bin
pkgver=2026.06.15
pkgrel=1
pkgdesc="A large-scale build system from Meta, developed in Rust"
arch=('x86_64' 'aarch64' 'riscv64gc')
url="https://github.com/facebook/buck2"
license=('Apache' 'MIT')
depends=('zstd')
options=('!strip')
provides=('buck2')

_formatted_date() {
    echo "$pkgver" | sed 's/\./-/g'
}

version() {
    curl -s 'https://api.github.com/repos/facebook/buck2/releases' | jq -r '.[1].tag_name' | sed 's/-/./g'
}

source_x86_64=("buck2-${pkgver}-x86_64.zst::https://github.com/facebook/buck2/releases/download/$(_formatted_date)/buck2-x86_64-unknown-linux-gnu.zst")
source_aarch64=("buck2-${pkgver}-aarch64.zst::https://github.com/facebook/buck2/releases/download/$(_formatted_date)/buck2-aarch64-unknown-linux-gnu.zst")
source_riscv64gc=("buck2-${pkgver}-riscv64gc.zst::https://github.com/facebook/buck2/releases/download/$(_formatted_date)/buck2-riscv64gc-unknown-linux-gnu.zst")

sha256sums_x86_64=('1304d8e4cee8066df825ecb4e286e4daee61a4adc7d3b187549c662636eef68b')
sha256sums_aarch64=('7556fcdbe04eb9aa445122a8944a445296ff5363d29c31aa8eac284c48773496')
sha256sums_riscv64gc=('a4300bff003a9edf0d6922e8159b138ccf8087bc9495ac214970c7aaf5aa160d')


case "$CARCH" in
    x86_64)
        _platform="x86_64-unknown-linux-gnu"
        ;;
    aarch64)
        _platform="aarch64-unknown-linux-gnu"
        ;;
    riscv64gc)
        _platform="riscv64gc-unknown-linux-gnu"
        ;;
esac


package() {
    cd "$srcdir"
    zstd -d -f "buck2-${pkgver}-${CARCH}.zst" -c >buck2
    install -Dm755 buck2 "$pkgdir/usr/bin/buck2"
}
