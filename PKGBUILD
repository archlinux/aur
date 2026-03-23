# Maintainer: yeggis <yeggis@users.noreply.github.com>
pkgname=chevren
pkgver=1.0.3
pkgrel=2
pkgdesc="Turkish subtitle generator for YouTube videos and local files"
arch=('x86_64')
url="https://github.com/yeggis/chevren"
license=('MIT')
depends=(
  'python'
  'python-pytorch-cuda'
  'ffmpeg'
  'yt-dlp'
  'mpv'
)
makedepends=('python-pip' 'python-virtualenv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yeggis/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66d66b7de746eb672a2baaea1689eb6b747e2d8b748ce0ae86245238545b38aa')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Ana dizin
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r src "$pkgdir/usr/share/$pkgname/"

  # venv oluştur ve bağımlılıkları kur
  python -m venv "$pkgdir/usr/share/$pkgname/venv"
  "$pkgdir/usr/share/$pkgname/venv/bin/pip" install \
    faster-whisper google-genai \
    --no-compile \
    --quiet

  # Çalıştırılabilir script
  install -Dm755 chevren "$pkgdir/usr/share/$pkgname/chevren"

  # PATH'e sembolik link
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/share/$pkgname/chevren" "$pkgdir/usr/bin/chevren"

  # Lisans
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
