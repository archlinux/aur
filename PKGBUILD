# Template for the AUR package kvt-rusty-teams-bin. packaging/kvt/publish-aur.sh
# fills pkgver, _tag and sha256sums from the release on git.kvt.nl and pushes it
# with a generated .SRCINFO. Do not edit those three lines by hand in the AUR.
pkgname=kvt-rusty-teams-bin
pkgver=0.6.1.kvt.2
pkgrel=1
_tag=v0.6.1-kvt.2
pkgdesc='Native Microsoft Teams client in Rust (KVT build)'
arch=('x86_64')
url='https://git.kvt.nl/ict/rusty-teams'
license=('MIT')
depends=('glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcb' 'wayland' 'alsa-lib' 'libpipewire' 'libva' 'glib2' 'hicolor-icon-theme')
provides=('rusty-teams')
conflicts=('rusty-teams' 'rusty-teams-bin' 'rusty-teams-git')
options=('!strip' '!debug')
source=("rusty-teams-${_tag#v}-linux-x86_64.tar.gz::https://git.kvt.nl/api/v1/projects/ict/rusty-teams/releases/${_tag}/assets/rusty-teams-${_tag#v}-linux-x86_64.tar.gz")
sha256sums=('f809e1a6e933defcc437c22cf293cc5b854480481caef47895744c64a50d18d0')

package() {
  cd "rusty-teams-${_tag#v}-linux-x86_64"
  install -Dm755 bin/teams "$pkgdir/usr/bin/teams"
  install -Dm644 share/applications/rusty-teams.desktop "$pkgdir/usr/share/applications/rusty-teams.desktop"
  cp -a share/icons "$pkgdir/usr/share/"
  if [[ -d share/metainfo ]]; then
    cp -a share/metainfo "$pkgdir/usr/share/"
  fi
  install -Dm644 share/doc/rusty-teams/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The app never looks for updates when this file exists: pacman updates it.
  install -Dm644 /dev/null "$pkgdir/usr/lib/rusty-teams/package-managed"
}
