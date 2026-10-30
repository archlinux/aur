# Maintainer: Sven Nobis <aur@sven.to>

pkgname=gardenlogin-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='gardenlogin is kubectl credential plugin for Gardener K8s shoot cluster admin authentication.'
url='https://github.com/gardener/gardenlogin'
license=('Apache-2.0')
arch=('x86_64')
provides=('gardenlogin')
conflicts=('gardenlogin')
source=("gardenlogin::${url}/releases/download/v${pkgver}/gardenlogin_linux_amd64")
sha256sums=('0d41150a4b7e119eea7954cc538faa8e453a8e076cc31bc446ea61bceea9339c')

build() {
    # shell completion
    local _binary
    mkdir -vp completions
    _binary="$srcdir/gardenlogin"

    chmod +x $_binary
    $_binary completion bash > completions/gardenlogin
    $_binary completion zsh > completions/_gardenlogin
    $_binary completion fish > completions/gardenlogin.fish
}

package() {
    install -Dm 755 "$srcdir/gardenlogin" "$pkgdir/usr/bin/gardenlogin"
    ln -s /usr/bin/gardenlogin "$pkgdir/usr/bin/kubectl-gardenlogin"

    # install completions
    install -vDm 644 completions/gardenlogin -t "$pkgdir/usr/share/bash-completion/completions/"
    install -vDm 644 completions/_gardenlogin -t "$pkgdir/usr/share/zsh/site-functions/"
    install -vDm 644 completions/gardenlogin.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"

}
