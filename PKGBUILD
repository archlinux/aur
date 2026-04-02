# Maintainer: Zine Yu zine.xlws@gmail.com

pkgname=buck2-bin
pkgver=2026.04.01
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

sha256sums_x86_64=('4757ef36e8903b10a68bdfe86bcfc07d0e2be3b407806c2dcb6b620a2cc38ecd')
sha256sums_aarch64=('88becc1dc800c4cafbbd29290438869f9fc27411687adef06d107dc9f6612d93')
sha256sums_riscv64gc=('f65431dcbe981498aff4bc37e0e2e84d4c598861b04af439c6057daf9c148f8f')


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
