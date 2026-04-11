# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=1.29.7
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
sha256sums_aarch64=('8473e2f827186db837e14cba8006d231653c21bd92118be9885e7c0c11fc7e12')
sha256sums_x86_64=('bc59f73c63a22d3472ced8c0ab5ff00e7216e8bc007c8c9211cd983b83310ef0')
b2sums=('4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')
b2sums_aarch64=('fd21826fa85e7ca92076dd71f08c1e669bf96be63072484b518c4d206ae36dc525b27a8b089cf43889d4bfa7933823f1758488d3bc807662f5a621dfbff6f186')
b2sums_x86_64=('aba8eae10d3fd7190368f6a5e4f46ef589ddd5f28f0fa341dbcdf7ed0ea870ebbbdb3f061a6a26e3146d0c55ecf353592b63059989d74aed884c2610185ce1cf')

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
