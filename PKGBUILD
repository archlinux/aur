# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=pkgstate-bin
pkgver=0.2.3
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

source_x86_64=("$pkgname-$pkgver-linux-x86_64::https://github.com/pol-rivero/pkgstate/releases/download/0.2.3/pkgstate-linux-x86_64")
sha256sums_x86_64=('72b75aab76ddd062ad72f6f0cce54719812a0c6fae8863779fdd53f3d23f32cf')
source_aarch64=("$pkgname-$pkgver-linux-arm64::https://github.com/pol-rivero/pkgstate/releases/download/0.2.3/pkgstate-linux-arm64")
sha256sums_aarch64=('63de79209bcdc4a3e1932a8f538492a58e512a2a1c58f27c1ad82158c1752531')

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
