# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=edirstat-bin
_pkgname=edirstat
pkgver=2.0.0
pkgrel=1
pkgdesc="A fast, cross-platform disk usage analyzer with work-stealing multithreading, zero-copy snapshots, deduplication, and an interactive treemap GUI. (Precompiled Version)"
arch=('x86_64')
url="https://xangelix.itch.io/edirstat"
github_url="https://github.com/Xangelix/edirstat"
license=('MIT')
provides=("edirstat=$pkgver")
conflicts=('edirstat')

depends=('glibc' 'gcc-libs' 'libxkbcommon' 'fontconfig' 'hicolor-icon-theme')

optdepends=(
  'wayland: For running natively on Wayland compositors'
  'libx11: For running on traditional X11/Xorg desktops'
)

# Configure the manual download agent for the paywalled itch.io binary
DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please purchase/download '"edirstat-$pkgver-portable-x86_64"' manually from '"$url"' and place it in your build directory.')

source=(
  "manual://edirstat-$pkgver-portable-x86_64"
  "${_pkgname}.desktop"
  # Fetching the public source archive only for assets (icons, README, LICENSE)
  "${_pkgname}-$pkgver-source.tar.gz::${github_url}/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '424833b80c3c9f74b4f05a36ff6e9ac925ffe4a47da9398e660fbf3a293934af39bb4ba06e6986a190f76ce6f8aa96b0879ca0b84d534fdc58edd8291f38ba29'
  '5cbf9075b721335159eb3317cd3f787ac406fa7c398a2dea114870d362688f67809bbaaede155d8e1ad3a2830c35132ae37a02e24d9dabd60326b2b7e66a02b3'
  '6928a66d35df9a17d98c2873d1369393fc2b186eb3d11ab67bf24dd1f934dcce7142f7ca01e169e1bd8155feab3ebd3aa31305121752c8f511b1fae1aef3635d'
)

package() {
  # 1. Install the bare binary and rename it to 'edirstat'
  install -Dm 755 "$srcdir/edirstat-$pkgver-portable-x86_64" "$pkgdir/usr/bin/$_pkgname"

  # Use the public GitHub source archive for documentation, licenses, and icons
  cd "$srcdir/$_pkgname-$pkgver"

  # 2. Install the license file
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # 3. Install documentation
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"

  # 4. Install raster PNG icons across standard sizes
  local size
  for size in 16 32 48 64 128 256 512; do
    install -Dm 644 "assets/img/icon_${size}x.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
  done

  # 5. Install the scalable SVG icon
  install -Dm 644 "assets/img/icon-transparent.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  # 6. Install the .desktop file
  install -Dm 644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
