# Maintainer: hewlett26 <your@email.com>
pkgname=magnet-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="A unified package management wrapper for Arch Linux with Distrobox support"
arch=('any')
url="https://github.com/hewlett26/magnet"
license=('GPL3')
depends=(
    'bash'
    'distrobox'
    'podman'
    'yay'
)
optdepends=(
    'fish: fish shell tab completion'
)
provides=('magnet')
conflicts=('magnet')
source=("$pkgname::git+https://github.com/hewlett26/magnet.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    chmod +x bootstrap.sh
    chmod +x magnet
}

package() {
    cd "$pkgname"

    # Install magnet script
    install -Dm755 magnet "$pkgdir/usr/local/bin/magnet"

    # Install bootstrap script
    install -Dm755 bootstrap.sh "$pkgdir/usr/share/magnet/bootstrap.sh"

    # Install bash completion
    install -Dm644 magnet.bash-completion \
        "$pkgdir/usr/share/bash-completion/completions/magnet"

    # Install fish completion if fish is installed
    install -Dm644 magnet.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/magnet.fish"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
