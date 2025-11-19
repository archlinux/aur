# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli-bin
_name=${pkgname%-bin}
pkgver=1.20.0
pkgrel=6
pkgdesc="Prompt to code to deployment in your terminal"
arch=('aarch64' 'x86_64')
url='https://kiro.dev/cli/'
# By downloading and using Kiro CLI, you agree to the following:
#   AWS Customer Agreement: https://aws.amazon.com/agreement/
#   AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
#   Service Terms: https://aws.amazon.com/service-terms/
#   Privacy Notice: https://aws.amazon.com/privacy/
license=('LicenseRef-AWS-IPL')
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
b2sums=('798614bf2021111f2c6226ef97b2cd92aeb5201595b18c195921e48c8c225310ed5b85c28ec8a2b94a2649ed1fb3b9c7f6317cec218fe7e124469083a9e4b759')
b2sums_aarch64=('7eda3c969580f1bdf2cc7a639a00b11781abce5e3a9883100f0b3029b4f0ece9155b613b460e2aee2037497670d71d12343443503ed340327dc31877fecd2ccd')
b2sums_x86_64=('778b1532296eb1965713d17bb6a919d7d7f8ec17a8526b9a037770d1396080471736c3bbf93c77f1c8f8bd43057ee136dc92f43b7df3822394aa69dd44cbe575')

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
    cd kirocli
    install -Dm755 bin/$_name "$pkgdir/usr/bin/$_name"
    install -Dm755 bin/$_name-chat "$pkgdir/usr/bin/$_name-chat"
    install -Dm755 bin/$_name-term "$pkgdir/usr/bin/$_name-term"
    install -Dm755 bin/q "$pkgdir/usr/bin/q"
    install -Dm755 bin/q "$pkgdir/usr/bin/qchat"

    install -Dm644 "$srcdir/Kiro-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install shell completions
    install -Dm644 $_name.bash "$pkgdir/usr/share/bash-completion/completions/$_name"
    install -Dm644 $_name.zsh "$pkgdir/usr/share/zsh/site-functions/_$_name"
    install -Dm644 $_name.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
}
