# Maintainer: agony <27015 at riseup dot net>
pkgname=feishin-bin
pkgver=1.11.0
pkgrel=2
pkgdesc="A player for your self-hosted music server"
arch=('x86_64' 'aarch64')
url="https://github.com/jeffvli/feishin"
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
)
optdepends=('mpv: alternative audio backend')
provides=('feishin')
conflicts=('feishin')
options=(!strip)
source=("feishin.desktop")
source_x86_64=("feishin-${pkgver}-x64.tar.xz::${url}/releases/download/v${pkgver}/Feishin-linux-x64.tar.xz")
source_aarch64=("feishin-${pkgver}-arm64.tar.xz::${url}/releases/download/v${pkgver}/Feishin-linux-arm64.tar.xz")
sha256sums=('818f9700176bc3fbb3a00a1e6e41c933114f2a6029c8143a88239c5b9fc5c194')
sha256sums_x86_64=('22b60b60cea34b75808d337c19d9c80d5b135afbc1a1b8462a6f95bfbf754bc6')
sha256sums_aarch64=('edd31714f49bf6b68f31917a07e4bc453b9c361a498cd1b249f3203f0067048f')

package() {
  # The release tarball extracts to a single top-level directory containing
  # the full Electron bundle. Locate it robustly rather than hardcoding.
  local _bundle
  _bundle=$(find "$srcdir" -maxdepth 1 -mindepth 1 -type d -name 'Feishin-linux-*' | head -1)

  # Ship the entire bundle under /usr/share/feishin/
  install -dm755 "$pkgdir/usr/share/feishin"
  cp -a "$_bundle"/. "$pkgdir/usr/share/feishin/"

  # /usr/bin/feishin is a symlink to the bundled launcher
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/share/feishin/feishin "$pkgdir/usr/bin/feishin"

  # Desktop entry (previous maintainer's richer version)
  install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/feishin.desktop"

  # Icon, taken from the bundle's 512x512 asset
  install -Dm644 "$_bundle/resources/assets/icons/512x512.png" \
    "$pkgdir/usr/share/pixmaps/org.jeffvli.feishin.png"

  # License (bundled Electron license text)
  install -Dm644 "$_bundle/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
}
