# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=guiscrcpy
pkgver=2023.1.1
pkgrel=5
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
  'python-coloredlogs'
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
checkdepends=('appstream')
_commit=332175e50b63d1503c08afc5d839fc3f3fc50aba  # tags/v2023.1.1^0
source=("git+https://github.com/srevinsaju/guiscrcpy.git#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('7427D25413635E1E39657B6B1007816766D390D7') # Srevin Saju (srevinsaju) <srevinsaju@sugarlabs.org>

pkgver() {
  cd "$pkgname"
  git describe --tags --exclude continuous | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$pkgname"

  # Add non-localized key "Comment"
  desktop-file-edit --set-key=Comment --set-value="Comment=Screen mirroring application for Android" \
   "appimage/$pkgname.desktop"

  # Force launching with PySide2
  desktop-file-edit --set-key=Exec --set-value="env QT_API=pyside2 $pkgname" \
    "appimage/$pkgname.desktop"
}

build() {
  cd "$pkgname"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  appstreamcli validate --no-net "appimage/$pkgname.appdata.xml"
  desktop-file-validate "appimage/$pkgname.desktop"
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "appimage/$pkgname.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "appimage/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  for size in 128 256; do
    install -Dm644 appimage/${pkgname}-${size}.png -t \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
  done
}
