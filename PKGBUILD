# Maintainer: tak_0
pkgname=anti-ru-check
pkgver=1.0.0
pkgrel=1
pkgdesc="Wrapper and check script for makepkg/paru to warn about Russian maintainers"
arch=('any')
license=('GPL')
depends=('bash' 'jq' 'git' 'curl')
source=("anti-ru-check.sh" "makepkg.wrapper.sh"
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
    # Executables get 755
    install -Dm755 anti-ru-check.sh "$pkgdir/usr/bin/anti-ru-check"
    install -Dm755 makepkg.wrapper.sh "$pkgdir/usr/bin/makepkg.wrapper"

    # Data files get 644
    install -Dm644 ru-blocked-domains.txt "$pkgdir/usr/share/anti-ru-check/ru-blocked-domains.txt"
    install -Dm644 ru-blocked-locations.txt "$pkgdir/usr/share/anti-ru-check/ru-blocked-locations.txt"
    install -Dm644 ru-denylist.txt "$pkgdir/usr/share/anti-ru-check/ru-denylist.txt"
}

