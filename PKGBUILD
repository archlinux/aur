# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom < tomgparchaur at gmail dot com >
# Contributor: David Manouchehri <d@32t.ca>

pkgname=dropbox
pkgver=65.4.177
pkgrel=2
pkgdesc="A free service that lets you bring your photos, docs, and videos anywhere and share them easily."
arch=("i686" "x86_64")
url="https://www.dropbox.com"
license=(custom)
depends=("libsm" "libxslt" "libxmu" "libxdamage" "libxrender" "libxxf86vm" "libxcomposite" "fontconfig" "dbus")
makedepends=("gendesk")
optdepends=(
    'ufw-extras: ufw rules for dropbox'
    'perl-file-mimeinfo: opening dropbox folder on some desktop environments'
    'xdg-utils: for "Launch Dropbox Website" and file manager integration'
)
options=('!strip')

# The SVG link is retrieved from https://www.dropbox.com/branding
source=("dropbox-svg.zip"::"https://www.dropbox.com/scl/fo/0eu2dsn07fy5k0gt5fy74/AABelaoobzsW8ZKJ2u9vnINGa/Glyph/Dropbox/SVG?dl=1"
        "terms.txt" "dropbox.service" "dropbox@.service")
source_i686=("https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86-$pkgver.tar.gz"{,.asc})
source_x86_64=("https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-$pkgver.tar.gz"{,.asc})

sha256sums=('e53a2e006f7bd0421fec0b2d0eb31e88ca59bad7c9f640c4b126d462e674c3ed'
            '34605b2f36fe6b4bde9b858da3f73ac1505986af57be78bbb1c2c9cf1a611578'
            '6c67a9c8c95c08fafafd2f1d828074b13e3347b05d2e4f4bf4e62746115d7477'
            '98581e65a91ae1f19ed42edcdaaa52e102298b5da0d71b50089393d364474d3d')
sha256sums_i686=('9d1c0d77f31098ee157aa4186a7720599222d3b448250d7f767e177c5b6615c3'
                 'SKIP')
sha256sums_x86_64=('f7b46f47597541cc37b2975c84554db8d27f060d078affc56663d2ca2422af73'
                   'SKIP')
# The PGP key fingerprint should match the one on https://www.dropbox.com/help/desktop-web/linux-commands
validpgpkeys=(
  '1C61A2656FB57B7E4DE0F4C1FC918B335044912E'  # Dropbox Automatic Signing Key <linux@dropbox.com>
)

prepare() {
  gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" --categories=Network PKGBUILD
  # workaround https://bugreports.qt.io/browse/QTBUG-69378
  sed -i 's#<style>#<style type="text/css">#' DropboxGlyph_Blue.svg
}

package() {
	if [ "$CARCH" = "x86_64" ]; then
		_source_arch="x86_64"
	else
		_source_arch="x86"
	fi

	install -d "$pkgdir"/opt
	cp -dr --no-preserve=ownership "$srcdir"/.dropbox-dist/dropbox-lnx.$_source_arch-$pkgver "$pkgdir"/opt/dropbox

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/dropbox/dropbox "$pkgdir"/usr/bin/dropbox

	install -Dm644 "$srcdir"/dropbox.desktop -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir"/DropboxGlyph_Blue.svg "$pkgdir"/usr/share/pixmaps/dropbox.svg
	install -Dm644 "$srcdir"/terms.txt -t "$pkgdir"/usr/share/licenses/$pkgname
	install -Dm644 "$srcdir"/dropbox.service -t "$pkgdir"/usr/lib/systemd/user
	install -Dm644 "$srcdir"/dropbox@.service -t "$pkgdir"/usr/lib/systemd/system
}
