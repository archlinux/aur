pkgname=discbandit
pkgver=1.0
pkgrel=3
pkgdesc='Graphical audio CD ripper with metadata and artwork support'
arch=('any')
url='https://github.com/pacmanics/discbandit'
license=('GPL-3.0-or-later')

depends=(
  'python'
  'pyside6'
  'python-discid'
  'python-musicbrainzngs'
  'cdparanoia'
  'ffmpeg'
  'libcdio'
  'util-linux'
  'xdg-utils'
  'hicolor-icon-theme'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=(
  'e06c645a5b02f9de771aa4c75fa8c6b0443696df3b60bc26bb45c2e9bd17482d'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  install -Dm644 \
    packaging/linux/discbandit.desktop \
    "$pkgdir/usr/share/applications/discbandit.desktop"

  install -Dm644 \
    LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 \
      "assets/icons/hicolor/${size}x${size}/apps/discbandit.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/discbandit.png"
  done
}
