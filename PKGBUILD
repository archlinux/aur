# Maintainer: Good Vibes <good_vibes@fastmail.com>

pkgname=deskreen-ce-bin
pkgver=3.2.1
pkgrel=1
pkgdesc='Turn any device into a secondary screen for your computer - Community Edition (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/pavlobu/deskreen'
license=('AGPL-3.0-only')
provides=('deskreen-ce' 'deskreen')
conflicts=('deskreen-ce' 'deskreen' 'deskreen-bin')
source_x86_64=("deskreen-ce-$pkgver-amd64.deb::https://github.com/pavlobu/deskreen/releases/download/v$pkgver/deskreen-ce_${pkgver}_amd64.deb")
source_aarch64=("deskreen-ce-$pkgver-arm64.deb::https://github.com/pavlobu/deskreen/releases/download/v$pkgver/deskreen-ce_${pkgver}_arm64.deb")
b2sums_x86_64=('032b074a10cfb0b617094d9b85a1ca6727314281418e73e92e23ecc155502216c893abb76ceb129fb403fc93ce9e962756f82a24a556990e8b4bb497a10c7255')
b2sums_aarch64=('48de973028a48f582dcaf2924520b7a0d98961780f789027d34d4731cd38ed4cb006917631a2d7506607ac71b1a70323fd5d92d5e78539890ede460e6207490b')

package() {
    depends=('avahi'
             'gtk3'
             'libseccomp'
             'nss'
             'sqlite'
             'systemd-libs')

    bsdtar -xf data.tar.* -C "$srcdir/"

    # Install app to /opt/deskreen-ce
    install -d "$pkgdir/opt/deskreen-ce/"
    cp -r "$srcdir/opt/Deskreen CE/"* "$pkgdir/opt/deskreen-ce/"

    # Create symlink in /usr/bin
    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/deskreen-ce/deskreen-ce" "$pkgdir/usr/bin/deskreen-ce"

    # Install icon
    install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/deskreen-ce.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/deskreen-ce.png"

    # Install desktop file (modify to use our paths)
    install -d "$pkgdir/usr/share/applications/"
    sed -e 's|/opt/Deskreen CE/deskreen-ce|/usr/bin/deskreen-ce|g' \
        "$srcdir/usr/share/applications/deskreen-ce.desktop" > "$pkgdir/usr/share/applications/deskreen-ce.desktop"
    chmod 644 "$pkgdir/usr/share/applications/deskreen-ce.desktop"
}
