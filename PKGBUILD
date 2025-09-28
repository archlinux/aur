# Maintainer: tak_0
pkgname=suscheck
pkgver=1.0.0
pkgrel=1
pkgdesc="A script for makepkg/paru to warn about maintainers from countries you can find suspicious. This is not discriminating, but rather information giving tool,that allows to add to a list some domains or locations that you find suspicious for your reasons."
arch=('any')
license=('GPL')
depends=('bash' 'jq' 'git' 'curl')
source=("suspcheck.sh" "suscheck.sh" "makepkg.wrapper.sh"
        "suspcheck-blocked-locations.txt"
        "suspcheck-denylist.txt"
        "suspcheck-blocked-domains.txt"
        "suscheck-data/" "index.json")
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

    # Install uninstall script
    install -Dm755 suscheck-uninstall.sh "$pkgdir/usr/local/bin/suscheck-uninstall"

    # Install suscheck scripts
    install -Dm755 suspcheck.sh "$pkgdir/usr/local/bin/suspcheck.sh"
    install -Dm755 suscheck.sh "$pkgdir/usr/local/bin/suscheck.sh"

    # Create etc folders
    mkdir -p "$pkgdir/usr/local/etc"
    mkdir -p "$pkgdir/usr/local/etc/suscheck-data"

    # --- Old txt files (for legacy) ---
    cp -f suspcheck-blocked-locations.txt "$pkgdir/usr/local/etc/"
    cp -f suspcheck-denylist.txt "$pkgdir/usr/local/etc/"
    cp -f suspcheck-blocked-domains.txt "$pkgdir/usr/local/etc/"

    # --- Copy everything into suscheck-data (duplicates included) ---
    cp -f suspcheck-blocked-locations.txt "$pkgdir/usr/local/etc/suscheck-data/"
    cp -f suspcheck-denylist.txt "$pkgdir/usr/local/etc/suscheck-data/"
    cp -f suspcheck-blocked-domains.txt "$pkgdir/usr/local/etc/suscheck-data/"

    cp -f suscheck-data/*.txt "$pkgdir/usr/local/etc/suscheck-data/" 2>/dev/null || true
    cp -f suscheck-data/*.json "$pkgdir/usr/local/etc/suscheck-data/" 2>/dev/null || true

    # --- index.json at top level ---
    cp -f index.json "$pkgdir/usr/local/etc/index.json"
}
