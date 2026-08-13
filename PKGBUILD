# Maintainer: Good Vibes <good_vibes@fastmail.com>

pkgname=deskreen-ce-bin
pkgver=3.2.16
pkgrel=1
pkgdesc='Turn any device into a secondary screen for your computer - Community Edition (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/pavlobu/deskreen'
license=('AGPL-3.0-only')
provides=('deskreen-ce' 'deskreen')
conflicts=('deskreen-ce' 'deskreen' 'deskreen-bin')
source_x86_64=("deskreen-ce-$pkgver-amd64.deb::https://github.com/pavlobu/deskreen/releases/download/v$pkgver/deskreen-ce_${pkgver}_amd64.deb")
source_aarch64=("deskreen-ce-$pkgver-arm64.deb::https://github.com/pavlobu/deskreen/releases/download/v$pkgver/deskreen-ce_${pkgver}_arm64.deb")
b2sums_x86_64=('49145cab47c1f09c7f2b8d6f604945a3267e7310587a137d28cfe9f4e7818e71ca34b5a6daca937d60434997c2f63c77e5e351a1f71d15103c04c4a1298f2f29')
b2sums_aarch64=('2eeb009a1fae7bb9d90dac39ae197a346db87e645adb2c5f778bae4dcd206395506cd61b700d634c14dc66da81817a5e9e6100217a44c8d605f502f4d752a75f')

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
