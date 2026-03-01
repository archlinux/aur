# Maintainer:  NIyueeE <cuijy21@mails.tsinghua.edu.cn>
# References:  https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=thorium-browser-avx2-bin 


pkgname=thorium-browser-avx-bin
pkgver=138.0.7204.303
pkgrel=1
pkgdesc="Thorium browser AVX build (RPM binary) – Chromium fork focused on performance and security"
arch=('x86_64')
url="https://github.com/Alex313031/Thorium"
license=('BSD-3-Clause')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'libcups'
  'libnotify' 'libxcomposite' 'libxkbcommon' 'libxrandr'
  'libxdamage' 'mesa' 'nspr' 'nss' 'pango'
)
makedepends=('libarchive')
provides=('thorium-browser-avx')
conflicts=('thorium-browser-bin' 'thorium-browser-avx2-bin')
replaces=('thorium-browser-avx')

source=("https://github.com/Alex313031/thorium/releases/download/M${pkgver}/thorium-browser_${pkgver}_AVX.rpm")
noextract=("thorium-browser_${pkgver}_AVX.rpm")
sha256sums=('ba8b6d378ef7c2e2a61102a80a3fd7dab0127a5b197aa27e4f7c5c58ee0244d4')

package() {
  cd "$srcdir"
  bsdtar -xf "thorium-browser_${pkgver}_AVX.rpm"

  # Move binaries to /opt
  install -d "$pkgdir/opt/thorium-browser-avx"
  cp -r opt/chromium.org/thorium/* "$pkgdir/opt/thorium-browser-avx/"

  # Symlink to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /opt/thorium-browser-avx/thorium-browser "$pkgdir/usr/bin/thorium-browser-avx"

  # Fix sandbox permissions
  chmod 4755 "$pkgdir/opt/thorium-browser-avx/chrome-sandbox"

  # Desktop entry
  install -Dm644 usr/share/applications/thorium-browser.desktop \
    "$pkgdir/usr/share/applications/thorium-browser-avx.desktop"

  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/thorium-browser-avx %U|' \
    -e 's|^Icon=.*|Icon=thorium-browser-avx|' \
    -e 's|^Name=.*|Name=Thorium Browser AVX|' \
    -e 's|^Comment=.*|Comment=Chromium fork focused on performance (AVX build)|' \
    "$pkgdir/usr/share/applications/thorium-browser-avx.desktop"

  # Icon
  for size in 16 24 32 48 64 128 256; do
    install -Dm644 "opt/chromium.org/thorium/product_logo_${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/thorium-browser-avx.png"
  done

  # License
  if [ -f "opt/chromium.org/thorium/LICENSE" ]; then
    install -Dm644 opt/chromium.org/thorium/LICENSE \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}

post_install() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

post_upgrade() {
  post_install
}

