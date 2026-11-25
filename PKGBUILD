# Maintainer: Marcel W. Wysocki <maci.stgn@gmail.com>
pkgname=paseo-bun-bin
pkgver=0.17.4.bun.3
pkgrel=1
pkgdesc='Paseo native Bun AOT desktop and daemon with Elysia, Tauri v2 and UI performance patches (release binaries)'
arch=('x86_64')
url='https://github.com/maci0/paseo-bun'
license=('Apache-2.0')
depends=('glibc>=2.39' 'gcc-libs' 'gtk3' 'webkit2gtk-4.1' 'openssl' 'zlib' 'git')
optdepends=('openssh: SSH connections and Git remotes')
provides=("paseo-bun=$pkgver")
conflicts=('paseo-bun')
options=('!strip' '!debug')
_upstreamver=0.17.4-bun.3
_release=bun-aot-v${_upstreamver}
source=("paseo-bun-desktop-${_upstreamver}-linux-x64-aot.tar.gz::${url}/releases/download/${_release}/paseo-bun-desktop-${_upstreamver}-linux-x64-aot.tar.gz")
sha256sums=('5f997767c5e2be7e401476150e6426a86e6cd69fa2c4c42f36a904a22424060f')

check() {
  # The daemon reports the base Paseo version; the desktop reports the full Bun distribution version.
  [[ $("$srcdir/paseo-bun/paseo-bun" --version) == "${_upstreamver%%-bun.*}" ]]
  [[ $("$srcdir/paseo-bun/paseo-bun-desktop" --version) == "Paseo Bun Desktop $_upstreamver" ]]
}

package() {
  local _bundle="$srcdir/paseo-bun"
  install -dm755 "$pkgdir/usr/lib/paseo-bun" "$pkgdir/usr/bin"
  cp -a "$_bundle/." "$pkgdir/usr/lib/paseo-bun/"
  ln -s ../lib/paseo-bun/paseo-bun "$pkgdir/usr/bin/paseo-bun"
  ln -s ../lib/paseo-bun/paseo-bun-desktop "$pkgdir/usr/bin/paseo-bun-desktop"
  install -Dm644 "$_bundle/share/applications/sh.paseo.bun.desktop" "$pkgdir/usr/share/applications/sh.paseo.bun.desktop"
  install -Dm644 "$_bundle/share/icons/hicolor/256x256/apps/sh.paseo.bun.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/sh.paseo.bun.png"
  install -Dm644 "$_bundle/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
