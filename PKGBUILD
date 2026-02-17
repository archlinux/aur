# Maintainer: miaoermua <miaoermua@gmail.com>
# Updated for native pacman package support with multi-arch(arm64/amd64)

_pkgname=splayer
pkgname=splayer
pkgver=3.0.0
pkgrel=2
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
)
options=(!strip !debug)

if [ "$CARCH" = "x86_64" ]; then
    _arch_pkg="x64"
    _sha256="8f79803c4768b56ab80e3acd03a35e78d037d8a6b230de73157a9c30ce484fef"
elif [ "$CARCH" = "aarch64" ]; then
    _arch_pkg="aarch64"
    _sha256="e5a3b25f89a41432ca1ad633340fb2ae516dd76b0bab4e9e2cc52e8a196baca4"
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
