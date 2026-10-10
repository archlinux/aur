# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=2.29.0
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
sha256sums_aarch64=('9c9f3c4e7536a2ca2734919d4a77cb30127f4bbdc5a3ad6152fd005f0fab9174')
sha256sums_x86_64=('19cec2c609d51bf0043c5171d2769c331ecfaaeb3a055dd26fbac5434e702447')
b2sums=('67ddcca288e9f92ee33d5f1e56dd66164542f4f85421a0c6004f55ff94b961b8db6908b249dea65c68c048925acf11c82d0f6c24f7da3948249ecf2aa4ce3880')
b2sums_aarch64=('387b63302f645e7bc5b61cdb91f688acb3191127e3571ce0c454508921195286e682cd7a76657b396134e1cd516f8efbdbc3a6d57c92d4b6f17533e972cc90a6')
b2sums_x86_64=('0662a27cb90f11115bfd23c33237d7c6305ec73043639e0453c47f0943d2d4c9aeed812fd5cccf69f02cac954f35c5f23b178b5c256d853c71330142c8370b37')

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
