# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=1.23.1
pkgrel=1
pkgdesc="Prompt to code to deployment in your terminal"
arch=('aarch64' 'x86_64')
url='https://kiro.dev/cli/'
# By downloading and using Kiro CLI, you agree to the following:
#   AWS Customer Agreement: https://aws.amazon.com/agreement/
#   AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
#   Service Terms: https://aws.amazon.com/service-terms/
#   Privacy Notice: https://aws.amazon.com/privacy/
license=('LicenseRef-Kiro')
depends=('bzip2' 'gcc-libs' 'glibc' 'sh' 'xz')
conflicts=('amazon-q')
options=('!debug' '!strip')
install='kiro-cli.install'
source=('Kiro-LICENSE.txt')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-x86_64-linux.tar.zst")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-aarch64-linux.tar.zst")
sha256sums=('771836b4e338ba240ef4add028a0276f084c9e1c22fb5bb7fdcd83b87576bf2e')
sha256sums_aarch64=('988915878c20cd92baa3dd583d51eb5a378c3bbc581f957abd64d9093ced7d62')
sha256sums_x86_64=('c4b1ea72fe4518b4afa41f96848d9b5e5435dc5b0f037052f50a8b757043013f')
b2sums=('4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')
b2sums_aarch64=('294805003a3010a4dd9d8546ca15b8dc867dc4100d227e93eb01da9e5f17e5b9d845d11d8fbd0c58cd0a5a1252fe2748029b290e3ffaf7f36bd9390214a07180')
b2sums_x86_64=('f7d8ac28c4719e98513669fbf870c494ae4aed5138730f032c5bc847800d3a4a7ac090c3dab3bfe5067bff384d85470c54e5d3c6f5399c3ddd523eefd940c749')

prepare() {
    cd kirocli/bin
    sed -i 's|\$HOME/.local/bin/kiro-cli|/usr/bin/kiro-cli|g' q qchat
}

build() {
    cd kirocli
    ./bin/$pkgname completion bash > $pkgname.bash
    ./bin/$pkgname completion zsh > $pkgname.zsh
    ./bin/$pkgname completion fish > $pkgname.fish
}

package() {
    cd kirocli
    install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm755 bin/$pkgname-chat "$pkgdir/usr/bin/$pkgname-chat"
    install -Dm755 bin/$pkgname-term "$pkgdir/usr/bin/$pkgname-term"
    install -Dm755 bin/q "$pkgdir/usr/bin/q"
    install -Dm755 bin/q "$pkgdir/usr/bin/qchat"

    install -Dm644 $pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 $pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 $pkgname.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

    install -Dm644 "$srcdir/Kiro-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
