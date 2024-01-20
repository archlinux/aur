# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=guiscrcpy-git
pkgver=2023.1.1.r6.g9a912f9
pkgrel=1
epoch=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.srev.in"
license=('GPL-3.0-or-later')
depends=(
  'libxinerama'
  'pyside2'
  'python-cairosvg'
  'python-click'
  'python-colorama'
  'python-psutil'
  'python-pynput'
  'python-qtpy'
  'scrcpy'
)
makedepends=(
  'desktop-file-utils'
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/srevinsaju/guiscrcpy.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Add non-localized key "Comment"
  desktop-file-edit --set-key=Comment --set-value="Comment=Screen mirroring application for Android" \
    "appimage/${pkgname%-git}.desktop"

  # Force launching with PySide2
  desktop-file-edit --set-key=Exec --set-value="env QT_API=pyside2 ${pkgname%-git}" \
    "appimage/${pkgname%-git}.desktop"
}

build() {
  cd "${pkgname%-git}"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname%-git}"
  appstream-util validate-relax --nonet "appimage/${pkgname%-git}.appdata.xml" || :
  desktop-file-validate "appimage/${pkgname%-git}.desktop" || :
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "appimage/${pkgname%-git}.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "appimage/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"

  for size in 128 256; do
    install -Dm644 appimage/${pkgname%-git}-${size}.png -t \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
  done
}
