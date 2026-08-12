# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=matchlock
pkgver=0.2.17
pkgrel=1
pkgdesc="Lightweight Firecracker micro-VM sandbox for running AI agents securely"
arch=('x86_64' 'aarch64')
url="https://github.com/jingkaihe/matchlock"
license=('MIT')
# firecracker provides both firecracker and jailer; matchlock finds them on PATH.
# Upstream pins v1.10.1 but works against Arch's newer build.
depends=('firecracker' 'e2fsprogs' 'erofs-utils' 'libcap' 'nftables' 'kmod' 'procps-ng')
makedepends=('go')
options=('!debug')
install=matchlock.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/jingkaihe/matchlock/archive/v$pkgver.tar.gz")
sha256sums=('14c90611b745cbd7900336357b2a5b2413a87dca1a456db0cfcaf2dc8e14cdf9')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-X github.com/jingkaihe/matchlock/pkg/version.Version=$pkgver" \
    -o bin/matchlock ./cmd/matchlock

  # guest-init is PID 1 inside the microVM, whose bootstrap rootfs has no
  # dynamic loader — a PIE build would fail exec with ENOENT. Build it static,
  # matching upstream's release flags.
  GOFLAGS="-trimpath -mod=readonly -modcacherw" \
    go build -o bin/guest-init ./cmd/guest-init
  ! readelf -l bin/guest-init | grep -q INTERP
}

check() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  # matchlock resolves guest-init next to its own executable, so the real
  # binary lives in /usr/lib/matchlock with a symlink on PATH
  install -Dm755 bin/matchlock "$pkgdir/usr/lib/matchlock/matchlock"
  install -Dm755 bin/guest-init "$pkgdir/usr/lib/matchlock/guest-init"
  install -dm755 "$pkgdir/usr/bin"
  ln -s ../lib/matchlock/matchlock "$pkgdir/usr/bin/matchlock"

  install -Dm644 packaging/linux/sysctl/99-matchlock.conf \
    "$pkgdir/usr/lib/sysctl.d/99-matchlock.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
