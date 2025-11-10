# Maintainer: Guillermo Quinteros <gu.quinteros@gmail.com>
pkgname=listen
pkgver=2.1.0
pkgrel=2
pkgdesc="Minimal audio transcription tool - 100% on-premise"
arch=('any')
url="https://github.com/gmoqa/listen"
license=('MIT')
depends=('python' 'python-numpy' 'python-sounddevice' 'python-pytorch' 'portaudio' 'ffmpeg')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gmoqa/listen/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90fdbf4aeb3db47aa8c58da34981d8ea7809faf733b1da0fb425bc8408010068')

build() {
  cd "$pkgname-$pkgver"
  pip install --target="$srcdir/python-deps" openai-whisper
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 listen.py "$pkgdir/usr/bin/listen"
  install -Dm644 config.py "$pkgdir/usr/bin/config.py"

  python_version=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  install -dm755 "$pkgdir/usr/lib/python$python_version/site-packages"
  cp -r "$srcdir/python-deps/"* "$pkgdir/usr/lib/python$python_version/site-packages/"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
