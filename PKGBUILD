# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=1.22.0
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
conflicts=('amazon-q')
options=('!debug' '!strip')
install='kiro-cli.install'
source=('Kiro-LICENSE.txt')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-x86_64-linux.tar.zst")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-aarch64-linux.tar.zst")
sha256sums=('771836b4e338ba240ef4add028a0276f084c9e1c22fb5bb7fdcd83b87576bf2e')
sha256sums_aarch64=('7722693d1ecf41520a3864e1ff1bb15f35a02187051f34bdd8f56233a9df56e6')
sha256sums_x86_64=('b95b78027cdc11732ebc1ce5ee657cf83a4fa2f24c050404fcc0f5b96cfc55c4')
b2sums=('4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')
b2sums_aarch64=('f2eab0059be57062b801329924e4c78bed2bd423fbb432a3a6c6a68b49061166b7a4a587fbf0ab856485ac3862f4904a6c7c3f45453633b8cc70e06d09d6ffd3')
b2sums_x86_64=('738426ea1e0d06471cc94f290a0ba35387484d02407d60cbcf25be3f0769ec19df81f41f9c056ad4d5f346f11da05ee27973b4a5f1c308193c6e2ed92b703630')

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
    install -Dm644 Kiro-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    cd kirocli
    install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm755 bin/$pkgname-chat "$pkgdir/usr/bin/$pkgname-chat"
    install -Dm755 bin/$pkgname-term "$pkgdir/usr/bin/$pkgname-term"
    install -Dm755 bin/q "$pkgdir/usr/bin/q"
    install -Dm755 bin/q "$pkgdir/usr/bin/qchat"

    install -Dm644 $pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 $pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 $pkgname.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
