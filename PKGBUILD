# Maintainer: Aleksandar <salexandarz@github.com>
pkgname=mail-badge-notifier-git
pkgver=r5.85b4b7c
pkgrel=1
pkgdesc="Unread mail taskbar badges for Thunderbird/Betterbird with headless systemd service and GUI wrapper"
arch=('x86_64' 'aarch64')
url="https://github.com/salexandarz/mail-badge-notifier"
license=('MIT')
install=mail-badge-notifier-git.install
depends=('python' 'thunderbird' 'bash' 'systemd')
makedepends=('git' 'python')
provides=('mail-badge-notifier')
conflicts=('mail-badge-notifier')
source=("git+https://github.com/salexandarz/mail-badge-notifier.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mail-badge-notifier"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/mail-badge-notifier/addon"
  python3 -m zipfile -c ../mail-badge-bridge.xpi manifest.json background.js
}

package() {
  cd "$srcdir/mail-badge-notifier"

  install -Dm755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
  install -Dm755 uninstall.sh "$pkgdir/usr/share/$pkgname/uninstall.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  mkdir -p "$pkgdir/usr/share/$pkgname/helper" "$pkgdir/usr/share/$pkgname/addon"
  cp -r helper/* "$pkgdir/usr/share/$pkgname/helper/"
  cp -r addon/* "$pkgdir/usr/share/$pkgname/addon/"

  if [ -f mail-badge-bridge.xpi ]; then
    install -Dm644 mail-badge-bridge.xpi "$pkgdir/usr/share/$pkgname/mail-badge-bridge.xpi"
  fi
}
