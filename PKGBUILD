# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dankmail
pkgver=0.2.3
pkgrel=1
pkgdesc="Mail notifier with triage for Linux — Go daemon + Quickshell UI (DankMaterialShell aesthetic)"
arch=('x86_64' 'aarch64')
url="https://github.com/arqueon/dankmail"
license=('GPL-3.0-or-later')
depends=('quickshell' 'xdg-utils')
makedepends=('go')
optdepends=('gnome-keyring: Secret Service storage for tokens and passwords')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4b8aaff377b79dce185dc6b1b8a052faa7334c0fe7d0e803ed9b2b78be0eaab2')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  make -C core build VERSION="v$pkgver" COMMIT="release"
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 assets/systemd/dmail.service "$pkgdir/usr/lib/systemd/user/dmail.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 quickshell/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
