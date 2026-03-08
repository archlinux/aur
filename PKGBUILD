# Maintainer: fibsussy <fibsussy@tuta.io>
pkgname=keymux
pkgver=1.0.11
pkgrel=1
pkgdesc="Keyboard middleware for gaming with low-level input interception"
arch=('x86_64' 'aarch64')
url="https://github.com/fibsussy/keymux"
license=('MIT')
depends=('systemd' 'udev' 'libevdev')
makedepends=()
optdepends=('niri: automatic game mode detection in Niri compositor')
options=('!debug')
install=$pkgname.install

_arch="$CARCH"
if [ "$_arch" = "x86_64" ]; then
    _arch="x86_64"
elif [ "$_arch" = "aarch64" ]; then
    _arch="aarch64"
fi

source=(
    "https://github.com/fibsussy/keymux/releases/download/v${pkgver}/keymux-${pkgver}-${_arch}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/fibsussy/keymux/v${pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/keymux" "$pkgdir/usr/bin/keymux"
    install -Dm644 "$srcdir/keymux.service" "$pkgdir/usr/lib/systemd/system/keymux.service"
    install -Dm644 "$srcdir/keymux-niri.service" "$pkgdir/usr/lib/systemd/user/keymux-niri.service"
    install -Dm644 "$srcdir/config.example.ron" "$pkgdir/usr/share/doc/keymux/config.example.ron"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/keymux/README.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/keymux/LICENSE"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
    "$srcdir/keymux" completion bash > "$pkgdir/usr/share/bash-completion/completions/keymux"
    "$srcdir/keymux" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_keymux"
    "$srcdir/keymux" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/keymux.fish"
    install -dm755 "$pkgdir/etc/skel/.config/keymux"
}
