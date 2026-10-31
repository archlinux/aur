# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codemap-bin
pkgver=4.6.2
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
sha256sums_x86_64=('9c5cc0da68ff30b518f46aeafe5caf71af5794815fc6b7805d55fa0daa486325')
sha256sums_aarch64=('03c007508e3cfb25cd8d9824737f988b435ec376601e554068a9a085888eca4f')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/JordanCoin/codemap/releases/download/v${pkgver}/codemap_${pkgver}_linux_arm64.tar.gz")

latestver() {
    gh api --paginate repos/JordanCoin/codemap/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name | test("^codemap_[0-9.]+_linux_amd64\\.tar\\.gz$")) and any(.assets[]; .name | test("^codemap_[0-9.]+_linux_arm64\\.tar\\.gz$"))) | .tag_name' |
    head -1 | sed -E 's/^v//'
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
