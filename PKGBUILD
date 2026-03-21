# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=1.28.0
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
sha256sums_aarch64=('30684ee17f8a0666b130be3a096ae24aa894ed4143e934709b264f9be907dcfc')
sha256sums_x86_64=('eaccdab25eb72ba459c155f184b3eb61473ef8c177c5dba3f65153a79cd55112')
b2sums=('4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')
b2sums_aarch64=('a5e2825b1758fbe9f70811ae1c5807ab3f29e22b039c968b28bd64f53544d1343fb011b0262f7da6f72223d05fdad716778a30a9af5c8484ade19ec894a1ebce')
b2sums_x86_64=('491b5debd074ee9161e9d99b3693f172b712a398e00345db97cee4a41db4027a33209659ab39a0e3600b376e09eea99cddb61ecf621f6bd90fd41c7f07590185')

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
