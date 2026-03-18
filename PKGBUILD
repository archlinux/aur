# Maintainer: Rezn1r <rezn1r@proton.me>
# Maintainer: RAI SULEMAN <cerebellumdigital@gmail.com>

pkgname=thorium-browser-avx2-bin
pkgver=138.0.7204.303
pkgrel=2
pkgdesc="Thorium browser AVX2 build (RPM binary) – Chromium fork focused on performance and security"
arch=('x86_64')
url="https://github.com/Alex313031/Thorium"
license=('BSD-3-Clause')

depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'libcups'
  'libnotify' 'libxcomposite' 'libxkbcommon' 'libxrandr'
  'mesa' 'nspr' 'nss' 'pango'
)

makedepends=('rpm-tools' 'cpio')

provides=('thorium-browser')
conflicts=('thorium-browser')

source=("https://github.com/Alex313031/thorium/releases/download/M${pkgver}/thorium-browser_${pkgver}_AVX2.rpm")
noextract=("thorium-browser_${pkgver}_AVX2.rpm")

sha256sums=('53943adc878f2244fe85c7e7096a53d5e82359fa4196a78702a12d101278237b')

package() {
  cd "$srcdir"

  rpm2cpio "thorium-browser_${pkgver}_AVX2.rpm" | cpio -idmv

  # Move binaries to /opt
  install -d "$pkgdir/opt/thorium-browser-avx2"
  cp -r opt/chromium.org/thorium/* "$pkgdir/opt/thorium-browser-avx2/"

  # Symlink to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /opt/thorium-browser-avx2/thorium-browser "$pkgdir/usr/bin/thorium-browser-avx2"

  # Fix sandbox permissions
  chmod 4755 "$pkgdir/opt/thorium-browser-avx2/chrome-sandbox"

  # Desktop entry
  install -Dm644 usr/share/applications/thorium-browser.desktop \
    "$pkgdir/usr/share/applications/thorium-browser-avx2.desktop"

  sed -i \
    -e 's|Exec=.*|Exec=/usr/bin/thorium-browser-avx2 %U|' \
    -e 's|Icon=.*|Icon=thorium-browser-avx2|' \
    -e 's|Name=.*|Name=Thorium Browser AVX2|' \
    "$pkgdir/usr/share/applications/thorium-browser-avx2.desktop"

  # Icon
  for size in 16 24 32 48 64 128 256; do
    install -Dm644 "opt/chromium.org/thorium/product_logo_${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/thorium-browser-avx2.png"
  done
}