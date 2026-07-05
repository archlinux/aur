# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dankmail-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Mail notifier with triage for Linux — Go daemon + Quickshell UI (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/arqueon/dankmail"
license=('GPL-3.0-or-later')
depends=('quickshell' 'xdg-utils')
makedepends=('go' 'git')
optdepends=('gnome-keyring: Secret Service storage for tokens and passwords')
provides=('dankmail')
conflicts=('dankmail')
source=("dankmail::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd dankmail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dankmail
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  make -C core build
}

package() {
  cd dankmail
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 assets/systemd/dmail.service "$pkgdir/usr/lib/systemd/user/dmail.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 quickshell/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
