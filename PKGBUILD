# Maintainer: hexbyte16 <islamamara062@gmail.com>
pkgname=pomodoro-tui
pkgver=1.0.7
pkgrel=1
pkgdesc="Professional Pomodoro TUI with Discord and YouTube BGM support."
arch=('x86_64')
url="https://github.com/hexbyte16/rust-pomo-discord"
license=('MIT')
depends=('yt-dlp' 'ffmpeg' 'libdbus')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('802a0f2efe2c39d40f4e2760ff95870e266527e4f66c55bf262de238d5204493')

prepare() {
  cd "rust-pomo-discord-$pkgver" # تأكد أن هذا يطابق اسم المجلد داخل ملف الـ tar.gz
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "rust-pomo-discord-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "rust-pomo-discord-$pkgver"
  # هنا نقوم بتنصيب الملف وتغيير اسمه إلى pomodoro-tui ليكون هو الأمر المستخدم
  install -Dm755 "target/release/rust-pomo-discord" "$pkgdir/usr/bin/pomodoro-tui"
  
  # اختصار إضافي لسهولة الاستخدام (pomo)
  ln -s /usr/bin/pomodoro-tui "$pkgdir/usr/bin/pomo"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
