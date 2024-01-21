# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=normcap
pkgver=0.5.4
pkgrel=1
pkgdesc="OCR powered screen-capture tool to capture information instead of images"
arch=('any')
url="https://dynobo.github.io/normcap"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'leptonica'
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
  'xclip: clipboard access for Xorg, AwesomeWM and GNOME 45'
)
#checkdepends=(
#  'python-pytest-instafail' ## TODO
#  'python-pytest-cov'
#  'python-pytest-qt'
#  'python-pytest-xvfb'
#  'xclip'
#)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dynobo/normcap/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('e483d1fa1c2612b48d812811400b4b64c1d7ed9d7edd3971a0fb121ce8fcae74'
            '29992fdb19773faa7582e44fe4394d4772984d5b7b9b7b347617c387f0a260f9')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname-$pkgver"
#  pytest
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
    "$pkgdir/usr/share/metainfo/$pkgname.metainfo.xml"
  install -Dm644 "$srcdir/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
