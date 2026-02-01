# Maintainer: Zack <zack@example.com>
pkgname=bartender-git
pkgver=r1
pkgrel=1
pkgdesc="GTK4 status bar built with AGS for Hyprland - replaces waybar/mako"
arch=('x86_64')
url="https://github.com/johnzfitch/bartender"
license=('MIT')
depends=(
    'gjs'
    'gtk4'
    'gtk4-layer-shell'
    'libsoup3'
    'libadwaita'
    'alsa-utils'
    'curl'
    'dart-sass'
    # Astal packages from AUR
    'libastal-io-git'
    'libastal-4-git'
    'libastal-hyprland-git'
    'libastal-tray-git'
    'libastal-wireplumber-git'
    'libastal-network-git'
    'libastal-bluetooth-git'
    'libastal-notifd-git'
    'aylurs-gtk-shell'
)
optdepends=(
    'waybar: fallback status bar'
    'mako: fallback notification daemon'
    'mullvad-vpn: VPN integration'
)
makedepends=('git' 'npm')
provides=('bartender')
conflicts=('bartender')
source=("${pkgname}::git+https://github.com/johnzfitch/bartender.git")
sha256sums=('SKIP')
install=bartender.install

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    # Bundle with AGS, embedding the install path
    ags bundle app.tsx ./bartender -d "SRC='/usr/share/bartender'"
}

package() {
    cd "$srcdir/$pkgname"

    # Install the bundled executable
    install -Dm755 bartender "$pkgdir/usr/bin/bartender"

    # Install wrapper script for environment setup
    install -Dm755 "$srcdir/../bartender-wrapper" "$pkgdir/usr/bin/bartender-wrapper"

    # Install source files required at runtime (styles, icons, etc.)
    install -d "$pkgdir/usr/share/bartender"
    cp -r styles "$pkgdir/usr/share/bartender/"
    cp -r services "$pkgdir/usr/share/bartender/"
    cp -r widgets "$pkgdir/usr/share/bartender/"
    cp -r utils "$pkgdir/usr/share/bartender/"
    cp app.tsx Bar.tsx "$pkgdir/usr/share/bartender/"

    # Install systemd user service
    install -Dm644 "$srcdir/../bartender.service" "$pkgdir/usr/lib/systemd/user/bartender.service"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
