# Maintainer: Sven Nobis <aur@sven.to>

pkgname=gardenctl-bin
pkgver=2.12.0
pkgrel=1
pkgdesc='gardenctl is a command-line client for the Gardener (version 2).'
url='https://github.com/gardener/gardenctl-v2'
license=('Apache-2.0')
arch=('x86_64')
provides=('gardenctl')
conflicts=('gardenctl')
source=(
    "gardenctl::https://github.com/gardener/gardenctl-v2/releases/download/v${pkgver}/gardenctl_v2_linux_amd64"
    "gardenctl-profile.sh")
sha256sums=('8552532041d44080534c5f421ad111bef9aa45b2da3c4db51857c1b852f2aef9'
            '1001ebb1a3066132794d914e18a17938c3d06a86e043d1c62bfc62efa5ee4893')

build() {
    # shell completion
    local _binary
    mkdir -vp completions
    _binary="$srcdir/gardenctl"

    chmod +x $_binary
    $_binary completion bash > completions/gardenctl
    $_binary completion zsh > completions/_gardenctl
    $_binary completion fish > completions/gardenctl.fish
}

package() {
    install -Dm 755 "$srcdir/gardenctl" "$pkgdir/usr/bin/gardenctl"

    # install completions
    install -vDm 644 completions/gardenctl -t "$pkgdir/usr/share/bash-completion/completions/"
    install -vDm 644 completions/_gardenctl -t "$pkgdir/usr/share/zsh/site-functions/"
    install -vDm 644 completions/gardenctl.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"

    # install profile script for shell session
    install -Dm 755 "$srcdir/gardenctl-profile.sh" "$pkgdir/etc/profile.d/gardenctl.sh"
}
