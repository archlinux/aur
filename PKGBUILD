# Maintainer: Nicolas Ramirez-Diaz <support at tephro dot chat>
# The AUR's tephro-server-bin, written by `make aur SERVER=X.Y.Z` from
# server/deploy/aur/PKGBUILD.in. Edit the template in the Tephro repository,
# not the copy on the AUR.
#
# The release's own static binary, installed as /usr/bin/tephro-server, with
# the shipped systemd unit (data in /var/lib/tephro, run as the tephro user).
# The hashes come from the release's SHA256SUMS after its OpenPGP signature
# verified. pacman owns the binary, so `tephro-server admin upgrade` refuses
# to swap it and names the package command instead.
pkgname=tephro-server-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Self-hosted group chat server: text, voice, video and screen sharing in one binary (release build)"
arch=('x86_64' 'aarch64')
url="https://tephro.chat"
license=('AGPL-3.0-or-later')
depends=()
provides=('tephro-server')
conflicts=('tephro-server')
options=('!strip' '!debug')
source=('tephro-server.service' 'tephro-server.sysusers' 'tephro-server.tmpfiles')
source_x86_64=("tephro-${pkgver}-linux-amd64::https://gitlab.com/encenillo/tephro/-/releases/server%2Fv${pkgver}/downloads/tephro-${pkgver}-linux-amd64")
source_aarch64=("tephro-${pkgver}-linux-arm64::https://gitlab.com/encenillo/tephro/-/releases/server%2Fv${pkgver}/downloads/tephro-${pkgver}-linux-arm64")
sha256sums=('cc33d30fe1efec74ef78c23e6f574feaf7335519504365e6084215c4643b83be' '244b6d13190d4fdc1c92fee072484fad83a4f4bcbc7d3ba29ce683a3a6dd4d57' 'd2058578c4b27880a4fd6cedfe3956e9591c7afd240e11f8c78b55b4f3ceb57e')
sha256sums_x86_64=('a2c7b089d4c9ed38da08a4994603541315f4ce6c341c1bdbd5a1e42b38b7daea')
sha256sums_aarch64=('61f74ed559df43022c69c8155711fb16d3393bcd8403b0a7592c24a8d3c304b7')

package() {
  local goarch=amd64
  [[ $CARCH == aarch64 ]] && goarch=arm64
  install -Dm755 "tephro-${pkgver}-linux-${goarch}" "$pkgdir/usr/bin/tephro-server"
  sed 's|/usr/local/bin/tephro-server|/usr/bin/tephro-server|' tephro-server.service > tephro-server.service.pkg
  install -Dm644 tephro-server.service.pkg "$pkgdir/usr/lib/systemd/system/tephro-server.service"
  install -Dm644 tephro-server.sysusers "$pkgdir/usr/lib/sysusers.d/tephro-server.conf"
  install -Dm644 tephro-server.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/tephro-server.conf"
}
