# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli-bin
_name=${pkgname%-bin}
pkgver=1.21.0
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
sha256sums_aarch64=('16023ae596e7d20e972abfe6e405678dc66bee0a99d596b1b44c3eb2ad6974dd')
sha256sums_x86_64=('67db3703b13c045bbd55ed26e3a3acb61413d02def64cccac868fa1970e17750')
b2sums=('4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')
b2sums_aarch64=('eafb4b2ac67fd04283ecc82ff0cc7e5967c8d6b1145acb8f58a219b4261d7ba6867302d7e976b8e8c5a7d1cfe075e15ac19ebe2e8d8652d95035de10ac002093')
b2sums_x86_64=('ace4703cd8bbd0f9af0867516e191310f687d4175ace3665019801d28a5d68d08b8bc6e8990ea03626e0273019175d0a0c1560ce848f88f33638ddd2408f5fa3')


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
