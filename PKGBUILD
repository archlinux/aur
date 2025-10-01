# Maintainer: Sven Nobis <aur@sven.to>

pkgname=gardenlogin-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='gardenlogin is kubectl credential plugin for Gardener K8s shoot cluster admin authentication.'
url='https://github.com/gardener/gardenlogin'
license=('Apache-2.0')
arch=('x86_64')
provides=('gardenlogin')
conflicts=('gardenlogin')
source=("gardenlogin::${url}/releases/download/v${pkgver}/gardenlogin_linux_amd64")
sha256sums=('f5ad55e523570cac47ab52b41a4d5d276ad9cdef3c82b05a67ad20536a2694f2')

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
