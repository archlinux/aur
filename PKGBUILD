# Maintainer: pingod
# Upstream LICENSE (custom, non-SPDX): https://github.com/GuqiGG/Bili-Space/blob/master/LICENSE

pkgname=bili-space-bin
pkgver=0.1.63
pkgrel=1
pkgdesc="Bilibili desktop client with native GTK and isolated account profiles (official Linux build)"
arch=('x86_64')
url="https://github.com/GuqiGG/Bili-Space"
license=('custom')
depends=(
  'python' 'python-gobject' 'python-cairo'
  'gtk3' 'webkit2gtk-4.1'
  'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad'
  'gst-plugins-ugly' 'gst-libav'
)
provides=('bili-space')
conflicts=('bili-space')
source=(
  "Bili-Space-${pkgver}-linux.deb::https://github.com/GuqiGG/Bili-Space/releases/download/v${pkgver}/Bili-Space-${pkgver}-linux.deb"
  "linux-wayland-fixes.patch"
)
sha256sums=(
  '1b61087b67e20753255f161a26bf146449ad818c1582a8f5f816c40a899f1f69'
  'e04e8b3ffdfee240ce2a0dc0ef0ac4629e88b8648157542c4839b58562583e5f'
)
options=('!strip')

# The upstream .deb ships a GTK3/WebKit2GTK Linux host. Two upstream bugs make
# it unusable on GTK 3.24 + Wayland: the WebView gets a 1px-wide viewport
# (blank window), and the injected config is a startup-only snapshot (settings
# revert on navigation and onboarding / what's-new popups reappear every page).
# Drop this patch once upstream fixes both; it fails to apply loudly otherwise.
package() {
  cd "$srcdir"
  ar x "Bili-Space-${pkgver}-linux.deb" data.tar.zst
  bsdtar -xf data.tar.zst -C "$pkgdir"
  patch -d "$pkgdir" -p1 < linux-wayland-fixes.patch
}
