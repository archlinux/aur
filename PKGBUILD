# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=pkgstate-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="The perfect companion your dotfiles repo: declaratively define your installed packages, systemd services, and user groups (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/pkgstate"
license=('MIT')
provides=('pkgstate')
conflicts=('pkgstate')

depends=('pacman' 'systemd')
optdepends=(
    'doot: To manage your dotfiles repository'
    'yay: To be able to install AUR packages'
    'paru: To be able to install AUR packages'
)

source_x86_64=("$pkgname-$pkgver-linux-x86_64::https://github.com/pol-rivero/pkgstate/releases/download/0.2.5/pkgstate-linux-x86_64")
sha256sums_x86_64=('da4e02b6a91d2e3bd94ae869c191a3d929642c20ee58c3cad7e09805782b222f')
source_aarch64=("$pkgname-$pkgver-linux-arm64::https://github.com/pol-rivero/pkgstate/releases/download/0.2.5/pkgstate-linux-arm64")
sha256sums_aarch64=('6ad191e301d0b3672d278124d6f0ada6c91bf93f46d3e1b5df6428ac2ea0278e')

package() {
    # Install binary
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-linux-arm64" "$pkgdir/usr/bin/pkgstate"
    else
        install -Dm755 "$srcdir/$pkgname-$pkgver-linux-x86_64" "$pkgdir/usr/bin/pkgstate"
    fi

    # Generate and install shell completions
    install -d "$pkgdir/usr/share/bash-completion/completions"
    install -d "$pkgdir/usr/share/zsh/site-functions"
    install -d "$pkgdir/usr/share/fish/vendor_completions.d"

    "$pkgdir/usr/bin/pkgstate" completion bash > "$pkgdir/usr/share/bash-completion/completions/pkgstate"
    "$pkgdir/usr/bin/pkgstate" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_pkgstate"
    "$pkgdir/usr/bin/pkgstate" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/pkgstate.fish"
}
