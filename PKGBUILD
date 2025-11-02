# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: slact
pkgname=tlpui-git
_app_id="com.github.d4nj1.${pkgname%-git}"
pkgver=1.8.1.r0.g6c585cd
pkgrel=2
epoch=2
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL-2.0-or-later')
depends=(
  'gtk3'
  'python-gobject'
  'python-yaml'
  'tlp'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=(
  'appstream'
  'python-pytest'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/d4nj1/TLPUI.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^tlpui.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname%-git}"
  desktop-file-validate "${pkgname%-git}.desktop"
  appstreamcli validate --no-net "AppImage/${_app_id}.appdata.xml"

  pytest
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "AppImage/${_app_id}.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "${pkgname%-git}/icons/themeable/hicolor/scalable/apps/${pkgname%-git}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  for i in 16 32 48 64 128 96 128 256; do
    install -Dm644 "${pkgname%-git}/icons/themeable/hicolor/${i}x${i}/apps/${pkgname%-git}.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
  done
}
