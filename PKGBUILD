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
source_x86_64=("$_name-$pkgver-x86_64.zip::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-x86_64-linux.zip")
source_aarch64=("$_name-$pkgver-aarch64.zip::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-aarch64-linux.zip")
b2sums=('4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')
b2sums_aarch64=('0ed7991607d5568f9f28830546fd2bf01370e45da1a2ee7f555cb929e2e4d3b6ed5d1d0cab9c9bd336b9667716c09a47601623a499e84c59bf951827b5a3c4f0')
b2sums_x86_64=('e4f9e6b03bb2c0f154b8ab8140e929fb234e39f2ce7abec0d19d1b85b10bfb5b037e99920a361492f322532ed2b6a8a581c4f18cc4f0ed0b33746ddf9ceb4bc6')

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
