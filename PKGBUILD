# Maintainer: Nicolas Ramirez-Diaz <support at tephro dot chat>
# The AUR's tephro-server-bin, written by `make distros SERVER=X.Y.Z` from
# server/deploy/aur/PKGBUILD.in. Edit the template in the Tephro repository,
# not the copy on the AUR.
#
# The release's own static binary, installed as /usr/bin/tephro-server, with
# the shipped systemd units (data in /var/lib/tephro/default, more instances
# beside it through tephro-server@NAME, run as the tephro user).
# The hashes come from the release's SHA256SUMS after its OpenPGP signature
# verified. pacman owns the binary, so `tephro-server admin upgrade` refuses
# to swap it and names the package command instead.
pkgname=tephro-server-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Self-hosted group chat server: text, voice, video and screen sharing in one binary (release build)"
arch=('x86_64' 'aarch64')
url="https://tephro.chat"
license=('AGPL-3.0-or-later')
depends=()
provides=('tephro-server')
conflicts=('tephro-server')
options=('!strip' '!debug')
source=('tephro-server.service' 'tephro-server@.service' 'tephro-server.sysusers' 'tephro-server.tmpfiles')
source_x86_64=("tephro-${pkgver}-linux-amd64::https://gitlab.com/encenillo/tephro/-/releases/server%2Fv${pkgver}/downloads/tephro-${pkgver}-linux-amd64")
source_aarch64=("tephro-${pkgver}-linux-arm64::https://gitlab.com/encenillo/tephro/-/releases/server%2Fv${pkgver}/downloads/tephro-${pkgver}-linux-arm64")
sha256sums=('3ebba40ea53fcb7a071c46e2f176732fcde797d596b15520ad93278438bc0c26' 'dcf28b77b8404f020330827acf5c827f610a816d3d2189d1af584b896028d045' 'cd0cfdf2590d83d352a028e6ad1bf9c7bcddfabc43bce665d74ba4b2b3dcbde7' 'd2058578c4b27880a4fd6cedfe3956e9591c7afd240e11f8c78b55b4f3ceb57e')
sha256sums_x86_64=('2a110beda09de0c5f75009df52296e6ee66ed5f76e38b5be08d22f5f76a82954')
sha256sums_aarch64=('f0cabb040afbec8eb28bd957c22f73028a68367bd3227ea310c38f7f137e39bb')

package() {
  local goarch=amd64
  [[ $CARCH == aarch64 ]] && goarch=arm64
  install -Dm755 "tephro-${pkgver}-linux-${goarch}" "$pkgdir/usr/bin/tephro-server"
  local unit
  for unit in tephro-server.service tephro-server@.service; do
    sed 's|/usr/local/bin/tephro-server|/usr/bin/tephro-server|' "$unit" > "$unit.pkg"
    install -Dm644 "$unit.pkg" "$pkgdir/usr/lib/systemd/system/$unit"
  done
  install -Dm644 tephro-server.sysusers "$pkgdir/usr/lib/sysusers.d/tephro-server.conf"
  install -Dm644 tephro-server.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/tephro-server.conf"
}
