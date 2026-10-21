# Maintainer: 9M2PJU <9m2pju@hamradio.my>
# Contributor: HaythmKenway <akileswar2002@protonmail.com>
# Linux Passkey for Arch Linux and its derivatives.
#
# Stable release tarball from GitHub. The same file builds the AUR package
# (https://aur.archlinux.org/packages/linux-passkey) and the pacman
# repository at packages.akileswar.com; CI refreshes sha256sums from the
# tarball before building, so update it on every version bump.

pkgbase=linux-passkey
pkgname=(linux-passkey gnome-shell-extension-linux-passkey)
pkgver=0.1.0
pkgrel=1
pkgdesc='Passkeys for Linux (FIDO2 / WebAuthn authenticator)'
arch=(any)
url='https://github.com/HaythmKenway/Linux-Passkey'
license=(GPL-3.0-or-later)
source=("$url/releases/download/v$pkgver/linux-passkey-$pkgver.tar.gz")
sha256sums=('93146fd59aec59f623801baf47fa23933fea4586365de2cfcd031e34c3e190a0')

package_linux-passkey() {
  depends=(python python-cryptography python-gobject glib2 gtk4 'libadwaita>=1:1.5' hicolor-icon-theme
           libsecret publicsuffix-list polkit systemd)
  optdepends=('gnome-shell-extension-linux-passkey: approval prompts as GNOME Shell dialogs'
              'gnome-keyring: a login keyring for the master key')
  # Unrelated AUR packages `passkeyd` / `passkeyd-bin` (bjn7/passkeyd) ship
  # the same /usr/bin/passkeyd path; they cannot be co-installed.
  conflicts=('passkeyd' 'passkeyd-bin')
  install=linux-passkey.install

  cd "linux-passkey-$pkgver"
  make install-app install-locale DESTDIR="$pkgdir" PREFIX=/usr libexecdir=/usr/lib/linux-passkey
}

package_gnome-shell-extension-linux-passkey() {
  pkgdesc='GNOME Shell integration for Linux Passkey'
  depends=("linux-passkey=$pkgver-$pkgrel" 'gnome-shell>=1:45')

  cd "linux-passkey-$pkgver"
  make install-extension DESTDIR="$pkgdir" PREFIX=/usr
}
