# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=normcap
pkgver=0.4.2
pkgrel=1
pkgdesc="OCR powered screen-capture tool to capture information instead of images"
arch=('any')
url="https://dynobo.github.io/normcap"
license=('GPL')
depends=('leptonica' 'pyside6' 'python-certifi' 'python-jeepney' 'python-pillow'
         'python-pytesseract')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
#checkdepends=('python-levenshtein' 'python-pytest-qt' 'python-toml'
#              'tesseract-data-eng' 'tesseract-data-jpn' 'tesseract-data-chi_sim'
#              'wl-clipboard')
optdepends=('qt6-wayland: Required in Wayland sessions'
            'wl-clipboard: Required for clipboard access in Wayland sessions')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dynobo/normcap/archive/refs/tags/v$pkgver.tar.gz"
#        "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('d940a0a241106890b44884880b6c77aa5c07aee4a10edd8620a4f5ea471aa07a'
            '29992fdb19773faa7582e44fe4394d4772984d5b7b9b7b347617c387f0a260f9')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname-$pkgver"

## WIP
## Tests run normcap and pop up test windows
## Cannot be run successfully in chroot currently

  # use local XDG_RUNTIME_DIR
#  mkdir -p "$srcdir/run/user/1000"
#  export XDG_RUNTIME_DIR="$srcdir/run/user/1000"

#  # simulate GNOME desktop
#  export XDG_SESSION_TYPE='gnome'

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
}
