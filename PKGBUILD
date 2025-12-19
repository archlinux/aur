# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=1.23.0
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
depends=('bzip2' 'gcc-libs' 'glibc' 'sh' 'xz')
conflicts=('amazon-q')
options=('!debug' '!strip')
install='kiro-cli.install'
source=('Kiro-LICENSE.txt')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-x86_64-linux.tar.zst")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://desktop-release.q.us-east-1.amazonaws.com/$pkgver/kirocli-aarch64-linux.tar.zst")
sha256sums=('771836b4e338ba240ef4add028a0276f084c9e1c22fb5bb7fdcd83b87576bf2e')
sha256sums_aarch64=('cfe0f21a7688930b547fcc363aa21857230afa1e95089850210a1338e692ccc7')
sha256sums_x86_64=('11642d633fd5aa51b67a150e18f00daa662e0321a64a7cf4d64fa2bce74a7fd0')
b2sums=('4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')
b2sums_aarch64=('2a6b531211f77b4199de7dc339afdbfe289bba8af5758cc87d26cfb3a9823f59b082ec4211996dcd5ad0ae1f048ff147ec7a7450746e91249f668196df4f959f')
b2sums_x86_64=('c664cb6046e5bf4af6837c5cdd33425d767f00f8efeb988c9d5114202f36845f45161485ccd2af229a1699dc2045b67782121a679ab4c0991ccc833450b6d43a')

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
    cd kirocli
    install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm755 bin/$pkgname-chat "$pkgdir/usr/bin/$pkgname-chat"
    install -Dm755 bin/$pkgname-term "$pkgdir/usr/bin/$pkgname-term"
    install -Dm755 bin/q "$pkgdir/usr/bin/q"
    install -Dm755 bin/q "$pkgdir/usr/bin/qchat"

    install -Dm644 $pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 $pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 $pkgname.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

    install -Dm644 "$srcdir/Kiro-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
