# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli-bin
_name=${pkgname%-bin}
pkgver=1.20.2
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
depends=('gcc-libs' 'glibc' 'sh' 'xz')
optdepends=('bash-completion: bash tab completion support'
            'zsh-completions: zsh tab completion support')
provides=("$_name")
conflicts=("$_name" 'amazon-q-bin')
replaces=('amazon-q' 'amazon-q-bin')
install='kiro-cli.install'
source=('Kiro-LICENSE.txt')
source_x86_64=("$_name-$pkgver-x86_64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-x86_64-linux.tar.zst")
source_aarch64=("$_name-$pkgver-aarch64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-aarch64-linux.tar.zst")
sha256sums=('771836b4e338ba240ef4add028a0276f084c9e1c22fb5bb7fdcd83b87576bf2e')
sha256sums_aarch64=('2bb9b6fa10ab271ed8af14d30f5a56bb9d75b13ed50ae3b016f7056726ef6073')
sha256sums_x86_64=('c669de045b6b4a0661bde18d6e158fad7b01106d12d5673acc7fd4219af50044')
b2sums=('4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')
b2sums_aarch64=('c002d196acdeb5544619d457165335082908ca7be1d5161fd1a1e2968135dad6d752e0c7b7f66dc7d398a373954b59d3e100a0f502fff38c6c636cfb362e90ad')
b2sums_x86_64=('d23965e4c90e1c6665a26045a29c697e20b1c4277d9746fdb82de6a3932afa92ef6ad7046fbaed80ee549b97fc31be8e97e9e3156104eb284686958a16dff715')


prepare() {
    cd kirocli/bin
    sed -i 's|\$HOME/.local/bin/kiro-cli|/usr/bin/kiro-cli|g' q qchat
}

build() {
    cd kirocli
    ./bin/$_name completion bash > $_name.bash
    ./bin/$_name completion zsh > $_name.zsh
    ./bin/$_name completion fish > $_name.fish
}

package() {
    install -Dm644 Kiro-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    cd kirocli
    install -Dm755 bin/$_name "$pkgdir/usr/bin/$_name"
    install -Dm755 bin/$_name-chat "$pkgdir/usr/bin/$_name-chat"
    install -Dm755 bin/$_name-term "$pkgdir/usr/bin/$_name-term"
    install -Dm755 bin/q "$pkgdir/usr/bin/q"
    install -Dm755 bin/q "$pkgdir/usr/bin/qchat"

    install -Dm644 $_name.bash "$pkgdir/usr/share/bash-completion/completions/$_name"
    install -Dm644 $_name.zsh "$pkgdir/usr/share/zsh/site-functions/_$_name"
    install -Dm644 $_name.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
}
