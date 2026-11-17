# Maintainer: Tristan Jones <tristan at brones dot ca>

pkgname=openexpress-git
pkgver=0.10.6.r71.g4b51aec
pkgrel=1
pkgdesc="Unofficial Linux app for Garmin watches and bike computers"
arch=('any')
url="https://github.com/TomaszBojanowski/openExpress"
license=('GPL-3.0-or-later')
depends=('python' 'python-requests' 'python-gobject' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'gvfs-mtp')
makedepends=('git' 'gettext' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('libshumate: map on activity pages'
            'python-mutagen: music tags'
            '7zip: Garmin Express installers older than v8'
            'libusb: Connect IQ apps on devices that hide their app folder')
provides=('openexpress')
conflicts=('openexpress')
source=("git+https://github.com/TomaszBojanowski/openExpress.git")
sha256sums=('SKIP')

pkgver() {
  cd openExpress
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd openExpress
  python -m openexpress.catalogs
  python -m build --wheel --no-isolation
}

package() {
  cd openExpress
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Launcher, icons and AppStream metainfo (mirrors upstream's Flatpak manifest)
  local id=io.github.tomaszbojanowski.OpenExpress
  python -c "from openexpress.desktop import desktop_entry; print(desktop_entry('openexpress gui'), end='')" > "$id.desktop"
  install -Dm644 "$id.desktop" "$pkgdir/usr/share/applications/$id.desktop"
  install -Dm644 "openexpress/data/$id.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$id.svg"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps" openexpress/data/$id-*symbolic.svg
  install -Dm644 "openexpress/data/$id.metainfo.xml" "$pkgdir/usr/share/metainfo/$id.metainfo.xml"
}

