# Maintainer: Kris Kruse <kriskruse@users.noreply.github.com>
# Template rendered by .github/workflows/release.yml — 0.1.0 and
# 837e6185c269f7e65ee7f20391857de1fe993af584a805d9ec499d1db0e05a21 are substituted from the tagged release.
pkgname=waystone
pkgver=0.1.0
pkgrel=1
pkgdesc="Path of Exile 2 price-check overlay for Wayland (Hyprland)"
arch=('any')
url="https://github.com/kriskruse/waystone"
license=('AGPL-3.0-or-later' 'MIT')
depends=('python' 'python-gobject' 'python-opencv' 'python-numpy'
         'gtk4' 'gtk4-layer-shell'
         'xdg-desktop-portal-hyprland' 'wl-clipboard' 'xdotool' 'nodejs')
makedepends=('npm' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('837e6185c269f7e65ee7f20391857de1fe993af584a805d9ec499d1db0e05a21')

build() {
  cd "$pkgname-$pkgver"/brain
  npm ci
  npm run build
  cd ../poed
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  # brain bundle + game data (bundle resolves data at ../vendor/ee2/public)
  install -Dm644 brain/dist/server.mjs -t "$pkgdir/usr/lib/waystone/brain/dist/"
  mkdir -p "$pkgdir/usr/lib/waystone/brain/vendor/ee2"
  cp -r brain/vendor/ee2/public "$pkgdir/usr/lib/waystone/brain/vendor/ee2/"
  # poed
  python -m installer --destdir="$pkgdir" poed/dist/*.whl
  # launcher
  install -Dm755 packaging/waystone "$pkgdir/usr/bin/waystone"
  # licenses: project AGPL + vendored EE2 MIT
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 brain/vendor/ee2/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ee2-mit"
}
