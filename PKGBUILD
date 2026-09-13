# Maintainer: Yubo Cao <cao2006721@gmail.com>

# Unofficial packaging of the upstream Flectar Mail release binaries. Flectar
# does not produce or support this package; see TRADEMARKS.md upstream.

pkgname=flectar-mail-bin
pkgver=0.1.0alpha.5
# Upstream tags and release assets keep the SemVer prerelease hyphen
# (v0.1.0-alpha.5). pkgver may not contain one, and simply dropping it is what
# makes vercmp sort every prerelease *before* the eventual final 0.1.0, so no
# epoch is ever needed. Bump this together with pkgver.
_tagver=0.1.0-alpha.5
pkgrel=1
pkgdesc='Native email client built with Rust and Slint (unofficial build of the upstream release)'
arch=('x86_64')
url='https://github.com/flectar/mail'
license=('AGPL-3.0-only')
depends=('dbus' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libx11'
         'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'wayland'
         'xdg-utils')
optdepends=('xdg-desktop-portal: OAuth sign-in through the system browser and native file dialogs'
            'gnome-keyring: Secret Service provider for storing account credentials'
            'kwallet: alternative Secret Service provider'
            'gnupg: OpenPGP signing and encryption'
            'pinentry: passphrase prompts for GnuPG')
provides=("flectar-mail=$pkgver")
conflicts=('flectar-mail' 'flectar-mail-git')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$_tagver/flectar-mail_${_tagver//-/.}_amd64.deb")
# makepkg would happily unpack the `ar` container for us; keep it whole so
# package() is the only thing that decides what lands in $pkgdir.
noextract=("$pkgname-$pkgver.deb")
# Matches the SHA256SUMS published with the upstream release.
sha256sums=('8d1f113c6134498bff4beb67727a61665684fdb338dfcc9edea51e636905b1a9')

package() {
    # The .deb is an `ar` archive; unpack its payload straight into $pkgdir.
    # Upstream already ships a plain FHS layout (/usr/bin, /usr/lib/flectar-mail,
    # /usr/share/...), so nothing has to be relocated.
    bsdtar -xf "$pkgname-$pkgver.deb" -C "$srcdir" data.tar.zst
    bsdtar -xpf "$srcdir/data.tar.zst" -C "$pkgdir"

    # Upstream installs the AGPL text and third-party notices under
    # /usr/share/doc/flectar-mail; point the Arch license path at them instead
    # of shipping a second 34 KiB copy.
    install -dm755 "$pkgdir/usr/share/licenses"
    ln -s ../doc/flectar-mail "$pkgdir/usr/share/licenses/$pkgname"
}
