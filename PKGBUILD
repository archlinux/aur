# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prx
pkgver=0.1.0
pkgrel=1
pkgdesc="Safe proxy routing manager that keeps inbound connections (e.g. SSH) alive"
arch=('x86_64' 'aarch64')
url="https://src.panahifar.ir/ahp/prx"
license=('MIT')
depends=('glibc' 'nftables>=0.9.4' 'iproute2' 'systemd')
optdepends=(
  'sing-box: default proxy engine (TUN mode)'
  'polkit: run privileged actions through pkexec without sudo'
)
makedepends=('go')
provides=('prx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('681f7f51880d74001a78dba3d7d3191da20136473e74263269b26be904afd44e')

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=mod"
  go build -ldflags "-s -w -buildid= -X prx/internal/version.Version=$pkgver" -o prx ./cmd/prx
  go build -ldflags "-s -w -buildid=" -o prx-helper ./cmd/prx-helper
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 prx "$pkgdir/usr/bin/prx"
  install -Dm755 prx-helper "$pkgdir/usr/lib/prx/prx-helper"
  install -Dm644 polkit/org.prx.policy "$pkgdir/usr/share/polkit-1/actions/org.prx.policy"
  install -Dm644 systemd/prx-reapply.service "$pkgdir/usr/lib/systemd/system/prx-reapply.service"
  install -Dm644 systemd/prx-reapply.timer "$pkgdir/usr/lib/systemd/system/prx-reapply.timer"
  install -Dm644 man/prx.1 "$pkgdir/usr/share/man/man1/prx.1"
  install -Dm644 man/prx-helper.1 "$pkgdir/usr/share/man/man1/prx-helper.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

