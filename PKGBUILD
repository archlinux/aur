# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=guiscrcpy-git
pkgver=2023.1.1.r5.g077adac
pkgrel=2
epoch=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.srev.in"
license=('GPL3')
depends=(
  'libxinerama'
  'pyside2'
  'python-cairosvg'
  'python-click'
  'python-colorama'
  'python-psutil'
  'python-pynput''python-qtpy'
  'scrcpy'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'setconf'
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

  # Force launching with PySide2
  setconf "appimage/${pkgname%-git}.desktop" Exec "env QT_API=pyside2 ${pkgname%-git}"
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
