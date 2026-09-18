# Maintainer: Adrià Arrufat <adria.arrufat@gmail.com>
#
# Check for a new release with:
#   curl -so- https://apt.enpass.io/dists/stable/main/binary-amd64/Packages.gz | zcat | grep -E "Package|Version|SHA256" | head -n 3

pkgname=enpass
pkgver=6.12.6.2258
pkgrel=1
pkgdesc='Cross-platform password manager'
arch=('x86_64')
url='https://www.enpass.io/'
license=('LicenseRef-Enpass-EULA')
depends=('brotli' 'curl' 'dbus' 'fontconfig' 'freetype2' 'gcc-libs' 'gdk-pixbuf2'
         'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libglvnd'
         'libpsl' 'libx11' 'libxkbcommon' 'lsof' 'pango' 'util-linux-libs'
         'wayland' 'xz' 'zlib')
optdepends=('gnome-shell: keep the Enpass Assistant window on top (bundled extension)'
            'xdg-utils: open links in the default browser')
conflicts=('enpass-bin' 'enpass-beta')
source=("https://apt.enpass.io/pool/main/e/enpass/${pkgname}_${pkgver}_amd64.deb"
        'LICENSE')
sha256sums=('a98d2ff0d6ad392311022453598e59dcc2b9042cf9a001f0bf35e95aed5c3457'
            '8780f525e9cda983443286ed4be35d152a1ca062e09ec69977e52fd6227e3ce4')
# Upstream ships stripped binaries; stripping again breaks the browser extension's
# native messaging host.
options=('!strip')

package() {
    # The .deb was built as uid 1000, so drop its ownership or the installed
    # files end up owned by whatever local user has that uid.
    bsdtar -xf data.tar.* -C "$pkgdir" --no-same-owner
    chmod -R u+rwX,go+rX,go-w "$pkgdir"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/enpass/Enpass "$pkgdir/usr/bin/enpass"

    # GNOME Shell extension. Upstream's postinst copies the variant matching the
    # running shell; the "legacy" one targets GNOME 40-44, which Arch no longer
    # ships, so only the ES-module variant is installed. Enable it with:
    #   gnome-extensions enable enpass-assistant@enpass.io
    local uuid='enpass-assistant@enpass.io'
    install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/$uuid" \
        "$pkgdir/usr/share/enpass/gnome-extension/modern/"{extension.js,metadata.json}
    rm -r "$pkgdir/usr/share/enpass"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
