# Maintainer: Sean Stoves <sean@seanstoves.com>

# Upstream is closed source and only ships .deb/.rpm, so this repacks the .deb.
# New releases land at https://luggage.gg/luggage-desktop.html

pkgname=luggage-desktop
pkgver=1.14.0
# packaging revisions over upstream's re-pushed 1.14.0 (upstream keeps reusing the version):
#  -2 restored the missing quow-data map db
#  -3 declares the glibc>=2.39 floor the binary needs (moot on Arch, kept for parity)
pkgrel=3
pkgdesc="Modern Discworld MUD client with live map, item search, and plugin support"
arch=('x86_64')
url="https://luggage.gg/luggage-desktop.html"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'openssl'
         'cairo' 'gdk-pixbuf2' 'glib2' 'gcc-libs' 'glibc>=2.39' 'hicolor-icon-theme')
options=('!strip' '!debug')
source=("https://luggage.gg/development/LuggageDesktop/Luggage_${pkgver}_amd64.deb")
sha256sums=('2e7bd6a36bf9a9572dae32dc50d39a6409ea152a39eec75eccec6f461fb710e3')

package() {
    # makepkg already unpacked the .deb (ar archive) into srcdir
    bsdtar -xf data.tar.gz -C "$pkgdir"

    # upstream ships an empty Categories= so it lands nowhere in app menus
    sed -i 's/^Categories=$/Categories=Game;RolePlaying;/' "$pkgdir/usr/share/applications/Luggage.desktop"

    # no license text published upstream, just a copyright notice on the site
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Luggage Desktop is proprietary software.
Copyright (c) CallMeCarlos.com - All rights reserved.

Repackaged unmodified from the official binary release:
https://luggage.gg/luggage-desktop.html
EOF
}
