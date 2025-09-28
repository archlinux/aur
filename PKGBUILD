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
         "index.json" "suscheck-data.tar.gz")
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
    tar czf suscheck-data.tar.gz -C suscheck-data .

}

package() {
    # Install wrapper first
    install -Dm755 makepkg.wrapper.sh "$pkgdir/usr/local/bin/makepkg"

    #install restoring script
    install -Dm755 suscheck-uninstall.sh "$pkgdir/usr/local/bin/suscheck uninstall"


    # Install sus-check script
    install -Dm755 suspcheck.sh "$pkgdir/usr/local/bin/suspcheck.sh"

    # Install suscheck DB maintaining script
    install -Dm755 suscheck.sh "$pkgdir/usr/local/bin/suscheck.sh"


    # Install supporting files
    mkdir -p "$pkgdir/usr/local/etc"
    cp -f suspcheck-blocked-locations.txt "$pkgdir/usr/local/etc/"
    cp -f suspcheck-denylist.txt "$pkgdir/usr/local/etc/"
    cp -f suspcheck-blocked-domains.txt "$pkgdir/usr/local/etc/"

    # Extract the tarball into the subdirectory
    tar xzf suscheck-data.tar.gz -C "$pkgdir/usr/local/etc/suscheck-data"

}
