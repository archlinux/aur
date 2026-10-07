# Maintainer: Braulio Oliveira <brauliobo at gmail dot com>

pkgname=alacrium-browser-bin
pkgver=155.0.8059.39
pkgrel=1
pkgdesc='Performance-focused Chromium browser tracking stable releases (prebuilt)'
arch=('x86_64')
url='https://github.com/brauliobo/alacrium'
license=('BSD-3-Clause')
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
  'ttf-liberation'
  'vulkan-icd-loader'
  'xdg-utils'
)
optdepends=(
  'gnome-keyring: password storage in GNOME'
  'kdialog: native file dialogs in KDE'
  'kwallet: password storage in KDE'
  'pipewire: WebRTC desktop sharing under Wayland'
)
provides=("alacrium-browser=${pkgver}")
conflicts=('alacrium-browser')
options=('!debug' '!strip')
_deb="alacrium-browser_${pkgver}_AVX.deb"
_commit=42387eceaef8d19427ebf6962b72f6f961abd62a
source=(
  "https://github.com/brauliobo/alacrium/releases/download/M${pkgver}/${_deb}"
  "LICENSE-${_commit}.md::https://raw.githubusercontent.com/brauliobo/alacrium/${_commit}/LICENSE.md"
)
sha256sums=(
  '1023843452a1dccd2b906148009c4e7e3d41bdc113084d043039f37a8055ef6c'
  '1d43c681d483ed1bf2e88507be7368eea8d1dedc503d39b8e17e701d0be00fe2'
)
noextract=("$_deb")

package() {
  local logo size

  bsdtar -xOf "$srcdir/$_deb" data.tar.xz | bsdtar -xf - -C "$pkgdir"
  rm -rf "$pkgdir/etc/cron.daily"
  chmod 4755 "$pkgdir/opt/alacrium-browser/chrome-sandbox"
  for logo in "$pkgdir"/opt/alacrium-browser/product_logo_*.png; do
    size="${logo##*_}"
    size="${size%.png}"
    [[ "$size" =~ ^[0-9]+$ ]] || continue
    install -Dm644 "$logo" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/alacrium-browser.png"
  done
  install -Dm644 "$pkgdir/opt/alacrium-browser/alacrium.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/alacrium-browser.svg"
  install -Dm644 "$srcdir/LICENSE-${_commit}.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
