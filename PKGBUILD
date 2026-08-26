# Maintainer: hyperpuncher

pkgname=pi-ui-bin
pkgver=0.37.1
pkgrel=1
pkgdesc="Minimal GUI for pi"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/pi-ui"
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libgcc'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
)
makedepends=('patchelf')
options=('!strip')
provides=("pi-ui=$pkgver")
conflicts=('pi-ui')

source=("pi-logo.svg" "pi-ui.desktop" "LICENSE")
sha256sums=(
  '8f9a5fc5fbdb15969cc300d90781da827113dfb9c5109c16bf96a6c129b383a4'
  '2554a747e3d834f1ffd588530ceb46e3a3b8af4773282997df958d292bfc1b11'
  '6b7faf66323093e92a63a7d6d0cd20ef3718b77a2192e06cb00466fe870f14cf'
)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-x64.tar.zst")
sha256sums_x86_64=('6a8ae2fa55915a6a6ec343ba7157d6c94f21881a444b9dbbb05d128f7984f416')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-arm64.tar.zst")
sha256sums_aarch64=('69bf4324aac254a4e6adf1c48bcdf5ac1d1590b8d9cc9edfcbcf11410fbab254')

package() {
  install -d "$pkgdir/usr/lib/pi-ui"
  cp -a "$srcdir/pi-ui/." "$pkgdir/usr/lib/pi-ui/"
  # shellcheck disable=SC2016
  patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/pi-ui/pi-ui"
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/pi-ui" <<'EOF'
#!/usr/bin/bash
exec /usr/lib/pi-ui/pi-ui \
  --disable-spell-checking \
  "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/pi-ui"
  install -Dm644 "$srcdir/pi-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pi-ui.svg"
  install -Dm644 "$srcdir/pi-ui.desktop" "$pkgdir/usr/share/applications/pi-ui.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
