# SPDX-License-Identifier: 0BSD
# Maintainer: Joel Tony <github@jaytau.com>

pkgname=cmux-browser-nightly-bin
pkgver=151.0.7922.64
pkgrel=2
pkgdesc='Chromium browser and agent workspace with integrated terminal surfaces (nightly binary)'
arch=('x86_64')
url='https://cmux.com/linux'
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'ca-certificates'
  'cairo'
  'libcups'
  'dbus'
  'desktop-file-utils'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'ttf-liberation'
  'vulkan-icd-loader'
  'xdg-utils'
)
optdepends=(
  'qt5-base: native integration on Qt 5 desktops'
  'qt6-base: native integration on Qt 6 desktops'
)
provides=("cmux-browser=${pkgver}" "cmux-browser-stable=${pkgver}")
conflicts=('cmux-browser' 'cmux-browser-stable')
options=('!strip')
source_x86_64=("cmux-linux-x64-${pkgver}.deb::https://cmux.com/api/download/browser-nightly/linux-x64/deb")
sha256sums_x86_64=('cf0371eedaa7fd0a4b452164724eacd7a215e8063585c6a052e7bc384cac2e0a')

package() {
  bsdtar -xOf "$srcdir/cmux-linux-x64-${pkgver}.deb" data.tar.zst |
    bsdtar --no-same-owner -xf - -C "$pkgdir"

  rm -rf "$pkgdir/etc" \
    "$pkgdir/opt/cmux/browser/apparmor.d" \
    "$pkgdir/opt/cmux/browser/cron"
  rm "$pkgdir/opt/cmux/browser/cmux-update-feed-url"

  # Work around https://github.com/manaflow-ai/cmux-v2/issues/11 for this nightly.
  sed -i 's|"$HERE/chrome" "$@"|"$HERE/chrome" --enable-features=PartitionAllocDanglingPtr:type/cross_task "$@"|' \
    "$pkgdir/opt/cmux/browser/cmux-browser"
  grep -qF -- '--enable-features=PartitionAllocDanglingPtr:type/cross_task' \
    "$pkgdir/opt/cmux/browser/cmux-browser"

  ln -s cmux-browser-stable "$pkgdir/usr/bin/cmux-browser"

  local size
  for size in 16 24 32 48 64 128 256; do
    install -Dm644 "$pkgdir/opt/cmux/browser/product_logo_${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/cmux-browser.png"
  done
}
