# Maintainer: miaoermua <miaoermua@gmail.com>
# Updated for native pacman package support with multi-arch(arm64/amd64)

_pkgname=splayer
pkgname=splayer
pkgver=3.1.1
pkgrel=1

epoch=1
pkgdesc="Splayer | A minimalist music player"

arch=('x86_64' 'aarch64')
url="https://github.com/imsyy/SPlayer"
license=("AGPL-3.0-only")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(
  'c-ares'
  'ffmpeg'
  'gtk3'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify'
)
optdepends=(
  'http-parser: required by some Electron builds'
  'libappindicator: for system tray icon support'
  'mpv: for mpv playback engine support'
)
options=(!strip !debug)

if [ "$CARCH" = "x86_64" ]; then
    _arch_pkg="x64"
    _sha256="e358ad88f634029fd015ae1537631d913f875020600387db429211be0d94b92d"
elif [ "$CARCH" = "aarch64" ]; then
    _arch_pkg="aarch64"
    _sha256="022ec08c8597941038426dd349f28d2ea6add757044ee2e8eeda7878c00d0839"
else
    error "Unsupported architecture: $CARCH"
    exit 1
fi

source=("https://github.com/imsyy/SPlayer/releases/download/v${pkgver//_/-}/splayer-${pkgver//_/-}-${_arch_pkg}.pacman")
sha256sums=("${_sha256}")

noextract=("${source[0]##*/}")

package() {
    msg2 "Extracting native pacman package for $CARCH..."
    bsdtar -x -f "${srcdir}/${source[0]##*/}" -C "$pkgdir" --exclude .PKGINFO --exclude .MTREE --exclude .INSTALL
}
