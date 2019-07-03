# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Tom < tomgparchaur at gmail dot com >
# Contributor: David Manouchehri <d@32t.ca>

pkgname=dropbox
pkgver=75.4.141
pkgrel=1
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
  'libappindicator-gtk3: make tray icons themed under some desktop environments like KDE plasma'
)
options=('!strip')

# https://www.dropbox.com/scl/fo/0eu2dsn07fy5k0gt5fy74/AABbXqKHbY_mobVJhqgfOXYja/Glyph/Dropbox/SVG/DropboxGlyph_Blue.svg
source=("DropboxGlyph_Blue.svg"
        "terms.txt"
        "dropbox.service"
        "dropbox@.service")
source_i686=("https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86-$pkgver.tar.gz"{,.asc})
source_x86_64=("https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-$pkgver.tar.gz"{,.asc})

sha256sums=('9ba76205ec5838db85d822f23cfd7e2112fd2757e8031d8374709f102143c548'
            '34605b2f36fe6b4bde9b858da3f73ac1505986af57be78bbb1c2c9cf1a611578'
            '6c67a9c8c95c08fafafd2f1d828074b13e3347b05d2e4f4bf4e62746115d7477'
            '98581e65a91ae1f19ed42edcdaaa52e102298b5da0d71b50089393d364474d3d')
sha256sums_i686=('d08335e6854e5aa23d923b92a29f3e692aaf1ee06e4858503d1fc0fea79d8614'
                 'SKIP')
sha256sums_x86_64=('d5bf81eb56b7b005a186b1b19d5aff44dc88a0b617433e0ff232f810ac0f0b70'
                   'SKIP')
# The PGP key fingerprint should match the one on https://www.dropbox.com/help/desktop-web/linux-commands
validpgpkeys=(
  '1C61A2656FB57B7E4DE0F4C1FC918B335044912E'  # Dropbox Automatic Signing Key <linux@dropbox.com>
)

prepare() {
  gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" --categories=Network PKGBUILD
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
