# Maintainer: miaoermua <miaoermua@gmail.com>
# Updated for native pacman package support with multi-arch(arm64/amd64)

_pkgname=splayer
pkgname=splayer
pkgver=3.0.0_beta.6
pkgrel=2
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
    _sha256="d12773f70f78ddf9775cff6595d34c5843b435059936bc7bce19ec3680d7afb4"
elif [ "$CARCH" = "aarch64" ]; then
    _arch_pkg="aarch64"
    _sha256="3d165bfa12d5cd47ae09a4d32deeb0303043dff5d40878f5ce77bc9e3245c3f3"
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
