pkgname=discbandit
pkgver=1.0
pkgrel=2
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
  'f1f8b46a116e391da9eafa9f92b6f783c1a468c1d74e151487294e4a4e4ac012'
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
