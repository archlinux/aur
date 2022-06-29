# Maintainer: nekohasekai <contact-archlinux@sekai.icu>

pkgname=sing-ss-server-git
pkgver=r25.7311f6d
pkgrel=1
pkgdesc="A simple shadowsocks server."
arch=(x86_64)
url="https://github.com/sagernet/sing-tools"
license=(GPL3)
depends=(glibc)
makedepends=(go git)
provides=(ss-server)
conflicts=(sing-ss-server-dev-git)
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')
install=".install"

prepare() {
  cd "$srcdir/$pkgname"
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CGO_ENABLED=1
  cd "$srcdir/$pkgname"
  go build -v -o ss-server -buildmode=pie -trimpath -ldflags "-s -w -buildid=" ./cli/ss-server
  go build -v -o ss-server-gencfg -buildmode=pie -trimpath -ldflags "-s -w -buildid=" ./cli/ss-server-gencfg
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/ss-server/LICENSE"
  install -Dm644 release/ss-server/systemd/ss-server.service "$pkgdir/usr/lib/systemd/system/ss-server.service"
  install -Dm644 release/ss-server/systemd/ss-server@.service "$pkgdir/usr/lib/systemd/system/ss-server@.service"
  install -Dm755 ss-server -t "$pkgdir/usr/bin/"
  install -Dm755 ss-server-gencfg -t "$pkgdir/usr/bin/"
}
