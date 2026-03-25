# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codemap-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="A project brain for your AI. Give LLMs instant architectural context without burning tokens"
arch=('x86_64' 'aarch64')
url="https://github.com/JordanCoin/codemap"
license=('MIT')
provides=('codemap')
conflicts=('codemap')
depends=('git')
optdepends=('ast-grep: for dependency flow mode')
options=('!debug' '!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/JordanCoin/codemap/releases/download/v${pkgver}/codemap_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('7914080d000dfb4996cb68a3979aceb18fa908ccb966d5a08ca991a9f9e3567d')
sha256sums_aarch64=('e2983c90a3ee84aea963a6b095b6c465ec0e24c62b1bc74293dad5147908652d')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/JordanCoin/codemap/releases/download/v${pkgver}/codemap_${pkgver}_linux_arm64.tar.gz")

latestver() {
    curl -fsSL 'https://api.github.com/repos/JordanCoin/codemap/releases/latest' | jq -r 'select(any(.assets[]?; .name | test("^codemap_[0-9.]+_linux_amd64\\.tar\\.gz$")) and any(.assets[]?; .name | test("^codemap_[0-9.]+_linux_arm64\\.tar\\.gz$"))) | .tag_name' |
    sed -E 's/^v//'
}

package() {
    cd "$srcdir"
    
    install -Dm755 codemap "$pkgdir/usr/bin/codemap"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    if [ -d "sg-rules" ]; then
        install -d "$pkgdir/usr/share/codemap/sg-rules"
        install -m644 sg-rules/* "$pkgdir/usr/share/codemap/sg-rules/"
    fi
}
