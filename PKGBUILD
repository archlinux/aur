# Maintainer: tak_0
pkgname=ru-check
pkgver=1.0.0
pkgrel=1
pkgdesc="Wrapper and check script for makepkg/paru to warn about Russian maintainers"
arch=('any')
license=('GPL')
depends=('bash' 'jq' 'git' 'curl')
source=("ru-check.sh" "makepkg.wrapper.sh"
        "ru-blocked-locations.txt"
        "ru-denylist.txt"
        "ru-blocked-domains.txt")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    # Ensure paru exists
    if ! command -v paru &>/dev/null; then
        echo "📦 paru not found. Installing..."
        sudo pacman -S --needed base-devel --noconfirm
        (git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm)
    fi

    # Move real makepkg if it exists and makepkg.real does not
    if [[ -f /usr/bin/makepkg && ! -f /usr/bin/makepkg.real ]]; then
        sudo mv /usr/bin/makepkg /usr/bin/makepkg.real
    fi
}

package() {
    # Install wrapper first
    install -Dm755 makepkg.wrapper.sh "$pkgdir/usr/local/bin/makepkg"

    # Install ru-check script
    install -Dm755 ru-check.sh "$pkgdir/usr/local/bin/ru-check.sh"

    # Install supporting files
    mkdir -p "$pkgdir/usr/local/etc"
    cp -f ru-blocked-locations.txt "$pkgdir/usr/local/etc/"
    cp -f ru-denylist.txt "$pkgdir/usr/local/etc/"
    cp -f ru-blocked-domains.txt "$pkgdir/usr/local/etc/"
}
