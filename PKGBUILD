# Maintainer: Samet Demir <dev@sademir.com>
#
# Template — do not edit the generated PKGBUILD by hand. `update-aur.sh <version>` fills the
# @PLACEHOLDERS@ and pushes to the AUR. Repacks the released .deb (built by the desktop repo's
# GitLab CI and published to tinspec.dev); only the *latest* version's source URL resolves — the
# site prunes older artifacts on publish.
pkgname=tinspec-bin
pkgver=0.1.0preview.1
pkgrel=1
pkgdesc="Request-testing tool for backend developers — spec-driven endpoints, request chains, automated auth"
arch=('x86_64')
url="https://tinspec.dev"
license=('AGPL-3.0-only')
# The Arch closure of the .deb's Depends (webkit2gtk-4.1 + gtk3 and their usual companions).
# update-aur.sh prints the .deb's actual Depends on every run — reconcile if it changes.
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'hicolor-icon-theme' 'libsoup3' 'openssl')
optdepends=('xdg-desktop-portal-gtk: native file/folder pickers'
            'org.freedesktop.secrets: store auth secrets in the system keyring')
provides=('tinspec')
conflicts=('tinspec')
options=('!strip' '!debug')
_upver=0.1.0-preview.1
source=("https://tinspec.dev/releases/Tinspec_${_upver}_amd64.deb")
sha256sums=('02384145cfb136b16fd76f6ecde1d581ad789ac19e317693fdc8640d19850f9f')

package() {
  # The .deb is an ar archive whose payload is data.tar.{gz,xz,zst} — unpack it straight into
  # $pkgdir (it already carries usr/bin, icons, and the .desktop file). Updates flow through
  # pacman; the app detects newer releases but is notify-only for this install (no self-update).
  local data
  data=$(bsdtar -tf "$srcdir/Tinspec_${_upver}_amd64.deb" | grep '^data.tar')
  bsdtar -xOf "$srcdir/Tinspec_${_upver}_amd64.deb" "$data" | bsdtar -xf - -C "$pkgdir"
}
