# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dux-mail-git
pkgver=r126.edb1e01
pkgrel=1
pkgdesc="Mail notifier, triage controller, and MCP server for Linux — Go daemon + Quickshell UI (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/arqueon/dux-mail"
license=('GPL-3.0-or-later')
depends=('quickshell' 'xdg-utils')
makedepends=('go' 'git')
optdepends=('gnome-keyring: Secret Service storage for tokens and passwords')
provides=('dux-mail' 'dankmail')
conflicts=('dux-mail' 'dankmail' 'dankmail-git')
replaces=('dankmail-git')
install=dux-mail.install
source=("dux-mail::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd dux-mail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dux-mail
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  make -C core build
}

package() {
  cd dux-mail
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 assets/systemd/dmail.service "$pkgdir/usr/lib/systemd/user/dmail.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 quickshell/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
