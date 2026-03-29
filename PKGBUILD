# Maintainer: yeggis <yeggis@users.noreply.github.com>
pkgname=chevren
pkgver=1.0.14
pkgrel=1
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
sha256sums=('d76dfcba38d99444191ce384ea8db9e48a292e7afb49ce6a0d1afef2c0668528')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # venv'i srcdir'de oluştur
  python -m venv "$srcdir/venv"
  "$srcdir/venv/bin/pip" install \
    faster-whisper google-genai \
    "urllib3>=2.0" \
    "charset-normalizer>=3.0" \
    --no-compile \
    --quiet

  # shebang'i düzelt (srcdir → gerçek path)
  find "$srcdir/venv/bin" -type f \
    -exec sed -i "s|$srcdir/venv|/usr/share/$pkgname/venv|g" {} \; 2>/dev/null || true

  # makepkg uyarılarını (srcdir referansları ve 𝜋thon aliası) temizle
  rm -f "$srcdir/venv/bin/𝜋thon" 2>/dev/null || true
  sed -i "s|$srcdir/venv|/usr/share/$pkgname/venv|g" "$srcdir/venv/pyvenv.cfg" 2>/dev/null || true
  # Ana dizin
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r src "$pkgdir/usr/share/$pkgname/"

  # venv'i kopyala
  cp -r "$srcdir/venv" "$pkgdir/usr/share/$pkgname/"

  # Çalıştırılabilir script
  install -Dm755 chevren "$pkgdir/usr/share/$pkgname/chevren"

  # PATH'e sembolik link
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/share/$pkgname/chevren" "$pkgdir/usr/bin/chevren"

  # Lisans
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
