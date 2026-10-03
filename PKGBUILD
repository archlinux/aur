# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dankmail
pkgver=0.3.11
pkgrel=1
pkgdesc="Mail notifier with triage for Linux — Go daemon + Quickshell UI (DankMaterialShell aesthetic)"
arch=('x86_64' 'aarch64')
url="https://github.com/arqueon/dankmail"
license=('GPL-3.0-or-later')
depends=('quickshell' 'xdg-utils')
makedepends=('go')
optdepends=('gnome-keyring: Secret Service storage for tokens and passwords')
install=dankmail.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c32544de311968325b54f255f474754fe0c31fb47b56c8bc1d60f9aa7c9a5ae')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  # Release archives have no Git metadata; version information is supplied below.
  export GOFLAGS="-trimpath -mod=readonly -modcacherw -buildvcs=false"
  make -C core build VERSION="v$pkgver" COMMIT="release"
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 assets/systemd/dmail.service "$pkgdir/usr/lib/systemd/user/dmail.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 quickshell/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
