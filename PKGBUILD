# Maintainer: Braulio Oliveira <brauliobo at gmail dot com>

pkgname=alacrium-browser-bin
pkgver=151.0.7922.71
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
makedepends=('rpm-tools')
optdepends=(
  'gnome-keyring: password storage in GNOME'
  'kdialog: native file dialogs in KDE'
  'kwallet: password storage in KDE'
  'pipewire: WebRTC desktop sharing under Wayland'
)
provides=("alacrium-browser=${pkgver}")
conflicts=('alacrium-browser')
options=('!debug' '!strip')
_rpm="alacrium-browser_${pkgver}_AVX.rpm"
_commit=028ee37e0da2eda3f069f380e40322faddf2a39b
source=(
  "https://github.com/brauliobo/alacrium/releases/download/M${pkgver}/${_rpm}"
  "LICENSE-${_commit}.md::https://raw.githubusercontent.com/brauliobo/alacrium/${_commit}/LICENSE.md"
)
sha256sums=(
  'd5fa104519b58d49a17b6ad8adf36f8cde25fb610b03bcf108497bf44bca8bf4'
  '1d43c681d483ed1bf2e88507be7368eea8d1dedc503d39b8e17e701d0be00fe2'
)

package() {
  rpm2cpio "$srcdir/$_rpm" | bsdtar -xf - -C "$pkgdir"
  rm -rf "$pkgdir/etc/cron.daily"
  ln -s /opt/alacrium-browser/alacrium-browser \
    "$pkgdir/usr/bin/alacrium-browser"
  chmod 4755 "$pkgdir/opt/alacrium-browser/chrome-sandbox"
  install -Dm644 "$srcdir/LICENSE-${_commit}.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
