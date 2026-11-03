# Maintainer: Marc-Antoine Favreau <mafavreau AT solutionfvr DOT com>
# Contributor: khanhas <xuankhanh963 AT gmail DOT com> (original creator of spicetify-cli and its AUR package)
# Contributor: itsmeow <itsmeow AT itsmeow DOT dev>

pkgname=spicetify-cli-beta-bin
_pkgname=spicetify-cli-beta
pkgver=3.0.0_rc.3
pkgrel=1
_tag="v${pkgver//_/-}"
pkgdesc='Command-line tool to customize Spotify client (v3 beta, prebuilt)'
arch=('x86_64')
url='https://github.com/spicetify/cli'
license=('LGPL-2.1-only AND MIT')
depends=('glibc' 'libgcc')
conflicts=('spicetify-cli' 'spicetify')
options=('!debug' '!strip')
source=("${url}/releases/download/${_tag}/spicetify-${_tag#v}-linux-x86_64.tar.zst"
  "LICENSE-MIT-${_tag}::https://raw.githubusercontent.com/spicetify/cli/${_tag}/rust/LICENSE")
sha256sums=('d18e34e63b4bb4053ba0469841776dfbf0711e5da36eac1ab99b22487431eefa'
            'ef16fc852c03aa909cb55d3ae63d31f8b762abaccf0cb5144a149bf80ce5d701')

check() {
  test "$(./spicetify --version)" = "spicetify ${_tag#v}"
}

package() {
  # Own directory under /opt: the binary deletes every *.old file next to
  # itself on startup and expects spicetify-daemon as a sibling.
  install -Dm755 -t "${pkgdir}/opt/${_pkgname}" spicetify spicetify-daemon

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/spicetify" "${pkgdir}/usr/bin/spicetify"

  install -Dm644 "LICENSE-MIT-${_tag}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
