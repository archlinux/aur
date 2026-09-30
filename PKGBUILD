# PKGBUILD (SuperScience Blue, packaging/aur)
# Created: 2026-09-28 05:45 | Last change: 2026-09-29 19:37 — 1.1.1-2: install messages name both themes.
# The AUR package: installs the theme from a GitHub release. packaging/local/PKGBUILD
# installs the same files from the working tree, for testing before a release.
#
# Maintainer: Robert Muncrief <linux-dev@lightyeardesigns.com>

pkgname=superscience-blue-gtk-theme
pkgver=1.1.1
pkgrel=2
pkgdesc="A clean blue theme for GTK2, GTK3, GTK4/libadwaita and Xfwm4, with a dark variant"
arch=('any')
url="https://github.com/muncrief/superscience-blue"
license=('GPL-3.0-or-later')
optdepends=('gtk-engine-murrine: GTK2 apps'
            'gnome-themes-extra: GTK2 apps (Adwaita engine)')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b75331128ec68580c76ab4b463b8c3ed8f182d899d856a0e0ce392a5934159fe')

package()
{
    local root="$srcdir/superscience-blue-$pkgver"
    local dest="$pkgdir/usr/share/themes/SuperScience Blue"

    install -d "$dest"
    cp -r --no-preserve=mode,ownership "$root/theme/." "$dest/"

    # SuperScience Blue-Dark: its own GTK3/GTK4 files; window borders and dock
    # are the same as the light theme's, so they are links to it
    local dark="$pkgdir/usr/share/themes/SuperScience Blue-Dark"
    install -d "$dark"
    cp -r --no-preserve=mode,ownership "$root/theme-dark/." "$dark/"
    ln -s "../SuperScience Blue/xfwm4" "$dark/xfwm4"
    ln -s "../SuperScience Blue/plank" "$dark/plank"
    find "$dest" "$dark" -type d -exec chmod u=rwx,go=rx,g-s {} +
    find "$dest" "$dark" -type f -exec chmod 644 {} +

    install -Dm755 "$root/bin/superscience-blue-libadwaita" "$pkgdir/usr/bin/superscience-blue-libadwaita"
    install -Dm644 "$root/packaging/superscience-blue-libadwaita.desktop" \
        "$pkgdir/etc/xdg/autostart/superscience-blue-libadwaita.desktop"
    install -Dm644 "$root/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
