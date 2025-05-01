# Maintainer: RAI SULEMAN <cerebellumdigital@gmail.com>


pkgname=thorium-browser-avx2-bin
pkgver=130.0.6723.174
pkgrel=1
pkgdesc="Thorium browser AVX2 build (RPM binary) – Chromium fork focused on performance and security"
arch=('x86_64')
url="https://github.com/Alex313031/Thorium"
license=('BSD-3-Clause')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'libcups'
  'libnotify' 'libxcomposite' 'libxkbcommon' 'libxrandr'
  'mesa' 'nspr' 'nss' 'pango'
)
makedepends=('rpmextract' 'cpio')
provides=('thorium-browser')
conflicts=('thorium-browser')

source=("https://github.com/Alex313031/thorium/releases/download/M${pkgver}/thorium-browser_${pkgver}_AVX2.rpm")
noextract=("thorium-browser_${pkgver}_AVX2.rpm")
sha256sums=('045c1739692725cd46e8f144dcbdd26dff83fb6b085b43e035af55d7ede0c5ff')

package() {
  cd "$srcdir"
  rpmextract.sh "thorium-browser_${pkgver}_AVX2.rpm"

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
    -e 's|Exec=.*|Exec=/usr/bin/thorium-browser-avx2|' \
    -e 's|Icon=.*|Icon=thorium-browser-avx2|' \
    -e 's|Name=.*|Name=Thorium Browser AVX2|' \
    "$pkgdir/usr/share/applications/thorium-browser-avx2.desktop"

  # Icon
  for size in 16 24 32 48 64 128 256; do
    install -Dm644 "opt/chromium.org/thorium/product_logo_${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/thorium-browser-avx2.png"
  done
}

