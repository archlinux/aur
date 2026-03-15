# Maintainer: Zine Yu zine.xlws@gmail.com

pkgname=buck2-bin
pkgver=2026.03.15
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

sha256sums_x86_64=('346383b6e123dae7479f57a7f99740b7b0bebea4713050380fd6ec309e41fc5e')
sha256sums_aarch64=('8d92d9c5490efe77611c8debb670c548dbb928834a27ba0ba4b49817dfbc2e4a')
sha256sums_riscv64gc=('0dd12e450b3e8defc19690a93372064f1f0a39e953064cc6d87c51e028dc328b')


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
