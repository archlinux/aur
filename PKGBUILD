# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=normcap
_app_id="eu.dynobo.$pkgname"
pkgver=0.5.8
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
)
makedepends=(
  'python-babel'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-toml'
  'python-wheel'
)
optdepends=(
  'qt6-wayland: Required in Wayland sessions'
  'wl-clipboard: clipboard access for Wayland'
  'xclip: clipboard access for Xorg'
  'xsel: alternative Xorg clipboard handler'
)
#checkdepends=(
#  'python-pytest-instafail' ## TODO
#  'python-pytest-cov'
#  'python-pytest-qt'
#  'python-pytest-xvfb'
#  'xclip'
#  'xdg-desktop-portal'
#)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dynobo/normcap/archive/refs/tags/v$pkgver.tar.gz"
        "${_app_id}.desktop")
sha256sums=('0d7a67954c45c8339c461eb612aadddb88328b0dfb847217641e1aeb52ae0e8a'
            '29992fdb19773faa7582e44fe4394d4772984d5b7b9b7b347617c387f0a260f9')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname-$pkgver"
#  export HOME=$(mktemp -d)
#  export DISPLAY=:$((2000 + $RANDOM % 1000))
#  xvfb-run ${DISPLAY} -screen 5 1024x768x8 dbus-run-session pytest
#}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  for icon_size in 16 32 64 128 256 512; do
    install -Dm644 bundle/imgs/$pkgname-${icon_size}.png \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/$pkgname.png"
  done

  install -Dm644 "bundle/imgs/$pkgname.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 bundle/metainfo \
    "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"
  install -Dm644 "$srcdir/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
