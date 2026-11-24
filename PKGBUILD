# Maintainer: Alberto Oliveira <orkan.aos at gmail dot com>
# SPDX-License-Identifier: 0BSD

pkgname=neostation-bin
pkgver=1.0.0rc2.3002
pkgrel=1
pkgdesc='Controller-friendly emulation frontend with artwork and RetroAchievements integration'
arch=('x86_64' 'aarch64')
url='https://neostation.dev/'
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'libglvnd'
  'libpulse'
  'libsecret'
  'libx11'
  'pango'
  'zlib'
)
makedepends=('7zip')
optdepends=(
  'retroarch: launch games through Libretro cores'
  'org.freedesktop.secrets: store account credentials using a desktop keyring'
  'xdg-utils: open web links in the default browser'
)
provides=("neostation=${pkgver}")
conflicts=('neostation')
options=('!strip' '!debug')

_upstream_version='1.0.0-rc.2+3002'
_upstream_tag='v1.0.0-rc.2%2B3002'
_upstream_commit='a91f2f0bfe0484ca961163a2acac0f677b9f1245'
_release_url="https://github.com/misobadev/neostation-frontend/releases/download/${_upstream_tag}"
source=(
  'neostation'
  "LICENSE.upstream::https://raw.githubusercontent.com/misobadev/neostation-frontend/${_upstream_commit}/LICENSE.md"
)
source_x86_64=("neostation-${_upstream_version}-x86_64.AppImage::${_release_url}/neostation-linux-x86_64-${_upstream_version/+/%2B}.AppImage")
source_aarch64=("neostation-${_upstream_version}-aarch64.AppImage::${_release_url}/neostation-linux-arm64-${_upstream_version/+/%2B}.AppImage")
noextract=(
  "neostation-${_upstream_version}-x86_64.AppImage"
  "neostation-${_upstream_version}-aarch64.AppImage"
)
sha256sums=('aab86a36bd72436893fb2f7197745c80d2c4312a5bef7e877bc01b7d9558eac2' '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('082d4ed8204459b1fbc44ed0a1c799e00edf0db4c948f78caaccdcaa90a88906')
sha256sums_aarch64=('a4127c7dbd0cdcd58fee9857629299111389b46620176ab8b0c63825cf9a90d1')

prepare() {
  # Extract without executing either architecture's AppImage runtime.
  7z x -y -bd -oappdir "neostation-${_upstream_version}-${CARCH}.AppImage" > /dev/null
}

package() {
  install -dm755 "${pkgdir}/opt/neostation"
  cp -a appdir/. "${pkgdir}/opt/neostation/"
  install -Dm755 neostation "${pkgdir}/usr/bin/neostation"
  install -Dm644 appdir/neostation.desktop "${pkgdir}/usr/share/applications/neostation.desktop"
  install -Dm644 appdir/neostation.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/neostation.png"
  install -Dm644 LICENSE.upstream "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
