# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=2.32.0
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
source=(Kiro-LICENSE.txt)
source_x86_64=($pkgname-$pkgver-x86_64.tar.zst::https://prod.download.cli.kiro.dev/stable/$pkgver/kirocli-x86_64-linux.tar.zst)
source_aarch64=($pkgname-$pkgver-aarch64.tar.zst::https://prod.download.cli.kiro.dev/stable/$pkgver/kirocli-aarch64-linux.tar.zst)
sha256sums=('1840298f83a857294aa3f5adfc85835127499df54c557d8c3df76f04a56acf55')
sha256sums_aarch64=('55cb24074ecfe42b543c450bd013ec25214281d67cffcbc1f67bfbf97bf83404')
sha256sums_x86_64=('81f95ec627b67b6072f146b9f278ab966d1c077fd57808945c75b4b87a4860ee')
b2sums=('67ddcca288e9f92ee33d5f1e56dd66164542f4f85421a0c6004f55ff94b961b8db6908b249dea65c68c048925acf11c82d0f6c24f7da3948249ecf2aa4ce3880')
b2sums_aarch64=('1af18dcac551ddd6eb9d0289d4fa3748c6e89157b7afe2317ba2dbdd405b6189670a72319fad9a613d873e2b6c8db074e84eb7853fffe2add8e7c9c8668380e3')
b2sums_x86_64=('a0afdcb8ae5185a292f8279c0b155db69f2db13cdd7eb8b7b1a391b12e45721738a5d9cd46f167f26bdccf070d115c5cf3eec74030ea2cea117936569647985d')

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
