# Maintainer: yeggis <yeggis@users.noreply.github.com>
pkgname=chevren
pkgver=1.0.19
pkgrel=3
pkgdesc="Turkish subtitle generator for YouTube videos and local files"
arch=('x86_64')
url="https://github.com/yeggis/chevren"
license=('MIT')
install=chevren.install
depends=(
  'python'
  'python-pytorch-cuda'
  'ffmpeg'
  'yt-dlp'
  'mpv'
)
makedepends=('python-pip' 'python-virtualenv' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yeggis/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b487447ef6182c2db059e052639e02f76010b7f007ed5b7c5885b943b7f07416')

build() {
  cd "$srcdir/$pkgname-$pkgver/server"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # venv'i srcdir'de oluştur
  python -m venv "$srcdir/venv"
  "$srcdir/venv/bin/pip" install \
    -r "$srcdir/$pkgname-$pkgver/requirements.txt" \
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

  # Server binary
  install -Dm755 "server/target/release/chevren-server" "$pkgdir/usr/bin/chevren-server"

  # Systemd user service
  install -Dm644 "server/systemd/chevren-server.service" \
    "$pkgdir/usr/lib/systemd/user/chevren-server.service"

  # Lisans
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
