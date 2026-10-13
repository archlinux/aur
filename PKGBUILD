# Maintainer: dz-vadim <https://github.com/dz-vadim>
#
# Release checklist: bump pkgver to the new tag (without the leading "v"),
# reset pkgrel=1, then replace the first 'SKIP' with the real checksum
# (`updpkgsums`) and regenerate .SRCINFO (`makepkg --printsrcinfo > .SRCINFO`).

pkgname=adaptive-coffee-wallpaper
_repo=adaptive-wallpapers
pkgver=1.4.1
pkgrel=1
pkgdesc="Wallpaper that adapts to season, time of day and weather: PyQt6 tray app + KDE Plasma 6 wallpaper plugin"
arch=('any')
url="https://github.com/dz-vadim/adaptive-wallpapers"
license=('MIT')
depends=('python' 'python-pyqt6' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=('plasma-workspace: use the native KDE Plasma 6 wallpaper plugin')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "adaptive-wallpaper.desktop")
sha256sums=('47b0d4af43fd3e564190a191f26094316ad166e514837223813ce063409d082e'
            'b2322bd0d290f3ad30af77e9630618cb5126435d14a007a555f67d82994f2f77')

build() {
  cd "$srcdir/$_repo-$pkgver/app"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_repo-$pkgver"

  # Python package (+ /usr/bin/adaptive-wallpaper{,-cli} entry points)
  python -m installer --destdir="$pkgdir" app/dist/*.whl

  # Wallpaper frames: every top-level NN_* file (extension not hard-coded),
  # never the _variations/ work folder.
  local frames="/usr/share/adaptive-wallpaper/wallpapers"
  install -dm755 "$pkgdir$frames"
  find wallpapers -maxdepth 1 -type f -name '[0-9][0-9]_*' \
    -exec install -m644 -t "$pkgdir$frames" {} +
  # (the app and the plugin both look in /usr/share/adaptive-wallpaper/wallpapers)

  # KDE Plasma 6 wallpaper plugin
  local plugin="/usr/share/plasma/wallpapers/org.dz.adaptivecoffee"
  install -dm755 "$pkgdir$plugin"
  cp -r --no-preserve=ownership plasma-plugin/org.dz.adaptivecoffee/. "$pkgdir$plugin/"
  find "$pkgdir$plugin" -type d -exec chmod 755 {} +
  find "$pkgdir$plugin" -type f -exec chmod 644 {} +

  # Launcher + icons
  install -Dm644 "$srcdir/adaptive-wallpaper.desktop" \
    "$pkgdir/usr/share/applications/adaptive-wallpaper.desktop"
  install -Dm644 app/adaptive_wallpaper/assets/adaptive-wallpaper.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/adaptive-wallpaper.png"
  install -Dm644 app/adaptive_wallpaper/assets/adaptive-wallpaper.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/adaptive-wallpaper.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
