# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=normcap
_app_id="com.github.dynobo.$pkgname"
pkgver=0.6.0
pkgrel=1
pkgdesc="OCR powered screen-capture tool to capture information instead of images"
arch=('any')
url="https://dynobo.github.io/normcap"
license=('AGPL-3.0-or-later AND MIT')
depends=(
  'hicolor-icon-theme'
  'leptonica'
  'libnotify'
  'pyside6'
  'python-jeepney'
  'python-pytesseract'
  'python-zxing-cpp'
  'shiboken6'
)
makedepends=(
  'python-babel'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-toml'
  'python-wheel'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
optdepends=(
  'gnome-screenshot: Preferred capture handler for GNOME'
  'gnome-shell-extension-window-calls: Window positioning handler for GNOME'
  'qt6-wayland: Required in Wayland sessions'
  'wl-clipboard: clipboard access for Wayland'
  'xclip: clipboard access for Xorg'
  'xsel: alternative Xorg clipboard handler'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dynobo/normcap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aae35b423c2cc586ffc01cc556b4e7965133cc24cea296677efdac3de134cd50')

prepare() {
  cd "$pkgname-$pkgver"

  # Dbus service path
  sed -i 's/app/usr/g' "bundle/flatpak/${_app_id}.service"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "bundle/flatpak/${_app_id}.appdata.xml"
  desktop-file-validate "bundle/flatpak/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  for icon_size in 16 32 64 128 256 512; do
    install -Dm644 bundle/imgs/$pkgname-${icon_size}.png \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/$pkgname.png"
  done

  install -Dm644 "bundle/imgs/$pkgname.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "bundle/flatpak/${_app_id}.appdata.xml" -t \
    "$pkgdir/usr/share/metainfo/"
  install -Dm644 "bundle/flatpak/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "bundle/flatpak/${_app_id}.service" -t \
    "$pkgdir/usr/share/dbus-1/services/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
