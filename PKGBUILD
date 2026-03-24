# Maintainer: yeggis <yeggis@users.noreply.github.com>
pkgname=chevren
pkgver=1.0.7
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
sha256sums=('37907773f8b1f79270365d17dda63dd0de34ee6fc8625f0e99fedaf6cf4fac78')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Ana dizin
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r src "$pkgdir/usr/share/$pkgname/"

  # venv oluştur ve bağımlılıkları kur
  python -m venv "$pkgdir/usr/share/$pkgname/venv"
  "$pkgdir/usr/share/$pkgname/venv/bin/pip" install \
    faster-whisper google-genai \
    "urllib3>=2.0" \
    "charset-normalizer>=3.0" \
    --no-compile \
    --quiet

  # venv shebang'ini düzelt
  find "$pkgdir/usr/share/$pkgname/venv/bin" -type f \
    -exec sed -i "s|$pkgdir||g" {} \; 2>/dev/null || true

  # Çalıştırılabilir script
  install -Dm755 chevren "$pkgdir/usr/share/$pkgname/chevren"

  # PATH'e sembolik link
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/share/$pkgname/chevren" "$pkgdir/usr/bin/chevren"

  # Lisans
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
