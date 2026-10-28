# Maintainer: Aleksandar Zarić <salexandarz@github.com>
pkgname=mail-badge-notifier-git
pkgver=r7.a73a6fd
pkgrel=4
pkgdesc="Unread mail taskbar badges for Thunderbird/Betterbird with headless systemd service and GUI wrapper"
arch=('x86_64' 'aarch64')
url="https://github.com/salexandarz/mail-badge-notifier"
license=('MIT')
install=mail-badge-notifier-git.install
depends=('python' 'thunderbird' 'bash' 'systemd')
makedepends=('git' 'python')
provides=('mail-badge-notifier')
conflicts=('mail-badge-notifier' 'mail-badge-bridge')
source=("git+https://github.com/salexandarz/mail-badge-notifier.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mail-badge-notifier"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/mail-badge-notifier"

  install -d "$pkgdir/usr/share/$pkgname"

  # Install helper scripts and source files
  install -Dm755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
  install -Dm755 uninstall.sh "$pkgdir/usr/share/$pkgname/uninstall.sh"
  install -Dm755 mail_badge_bridge.py "$pkgdir/usr/share/$pkgname/mail_badge_bridge.py"

  # Install pre-compiled XPI if present or build artifacts
  if [ -f mail-badge-bridge.xpi ]; then
    install -Dm644 mail-badge-bridge.xpi "$pkgdir/usr/share/$pkgname/mail-badge-bridge.xpi"
  fi

  # Return working directory to $srcdir before exiting fakeroot
  cd "$srcdir"
}
