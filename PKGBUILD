# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=1.28.2
pkgrel=1
pkgdesc='Prompt to code to deployment in your terminal'
arch=(aarch64 x86_64)
url='https://kiro.dev/cli/'
# By downloading and using Kiro CLI, you agree to the following:
#   AWS Customer Agreement: https://aws.amazon.com/agreement/
#   AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
#   Service Terms: https://aws.amazon.com/service-terms/
#   Privacy Notice: https://aws.amazon.com/privacy/
license=(LicenseRef-Kiro)
depends=(glibc libgcc sh)
conflicts=(amazon-q)
options=(!debug)
install=kiro-cli.install
source=(Kiro-LICENSE.txt)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-x86_64-linux.tar.zst")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-aarch64-linux.tar.zst")
sha256sums=('771836b4e338ba240ef4add028a0276f084c9e1c22fb5bb7fdcd83b87576bf2e')
sha256sums_aarch64=('05241a2ad40ba779993cbc7b82c2a0f098e691619600931b5d32e194a79dccd5')
sha256sums_x86_64=('6f026bc6ed0c92ed1b3b93df97b2dc09f582768800660dfc8ce98376009a5651')
b2sums=('4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')
b2sums_aarch64=('bd0f26eaad4d8dc2774b501592d02d7e18f8256f3c169447db8665ea287336fd286e56abfad2a4d434ddc736dd058b1b4e4d67dc6fab4ed824554fec97a6aee9')
b2sums_x86_64=('174ca67f41b6fc7bc873e382fb8c9080b2c21cb1e7a839813c7ea26f57d66915474b9f277fc342e39140fb8972c2f35c5bf9b58768e7e94d6ac28ebb9a28749b')

prepare() {
    cd kirocli/bin
    sed -i 's|\$HOME/.local/bin/kiro-cli|/usr/bin/kiro-cli|g' q qchat
}

build() {
    cd kirocli
    mkdir completions
    ./bin/kiro-cli completion bash > completions/kiro-cli
    ./bin/kiro-cli completion zsh > completions/_kiro-cli
    ./bin/kiro-cli completion fish > completions/kiro-cli.fish
}

package() {
    cd kirocli
    install -Dm755 bin/kiro-cli -t "$pkgdir/usr/bin"
    install -Dm755 bin/kiro-cli-chat -t "$pkgdir/usr/bin"
    install -Dm755 bin/kiro-cli-term -t "$pkgdir/usr/bin"
    install -Dm755 bin/q -t "$pkgdir/usr/bin"
    install -Dm755 bin/q -t "$pkgdir/usr/bin"

    install -Dm644 completions/kiro-cli -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 completions/_kiro-cli -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/kiro-cli.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"

    install -Dm644 "$srcdir/Kiro-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
