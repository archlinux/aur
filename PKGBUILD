# Maintainer: hyperpuncher

pkgname=pi-ui-bin
pkgver=0.19.0
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
  'a5624bc3b8cac94de75f6f13701eca2ad3ef67bbeba286c4af3f398806f0858a'
  '2554a747e3d834f1ffd588530ceb46e3a3b8af4773282997df958d292bfc1b11'
  '6b7faf66323093e92a63a7d6d0cd20ef3718b77a2192e06cb00466fe870f14cf'
)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-x64.tar.zst")
sha256sums_x86_64=('8a0320ff6d9a20901e6c6f8c951c263f672c74aa98676f42ac36ed2395f8f7e9')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-arm64.tar.zst")
sha256sums_aarch64=('527228c7ee8504396c28b4776f89331338eae6d3404972f5fbd3189329077695')

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
