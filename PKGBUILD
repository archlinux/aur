# Maintainer: Zine Yu zine.xlws@gmail.com

pkgname=buck2-bin
pkgver=2026.08.01
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

sha256sums_x86_64=('aa304d471a79f69233b09767d4ba9add769049b7a37f78a3a71a72983372f511')
sha256sums_aarch64=('83f1eb55f5d5df3b7b06cb4e7e864007d640ae16f1a86ab51e9bd02a6b9b724f')
sha256sums_riscv64gc=('c2522badb579fb2a161f382c97f9c96dab142bf2d78157731537667cc6d0b42b')


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
