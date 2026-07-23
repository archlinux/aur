# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=matchlock
pkgver=0.2.16
pkgrel=1
# Firecracker version pinned by upstream — keep in sync with .goreleaser.yaml
_fcver=1.10.1
pkgdesc="Lightweight Firecracker micro-VM sandbox for running AI agents securely"
arch=('x86_64' 'aarch64')
url="https://github.com/jingkaihe/matchlock"
license=('MIT' 'Apache-2.0')
depends=('e2fsprogs' 'erofs-utils' 'libcap' 'nftables' 'kmod' 'procps-ng')
makedepends=('go')
options=('!debug')
install=matchlock.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/jingkaihe/matchlock/archive/v$pkgver.tar.gz")
source_x86_64=("https://github.com/firecracker-microvm/firecracker/releases/download/v$_fcver/firecracker-v$_fcver-x86_64.tgz")
source_aarch64=("https://github.com/firecracker-microvm/firecracker/releases/download/v$_fcver/firecracker-v$_fcver-aarch64.tgz")
sha256sums=('a73fd65180f45fc741a9192645d1b585125d8cea6e4d66769725dda3b3a8de48')
sha256sums_x86_64=('36112969952b0e34fadcfca769d48a55dc22cbba99af17e02bd0e24fc35adc77')
sha256sums_aarch64=('9e3641071de140979afaac0c52fdc107baeba398bdb5709c12f77ee469207fcd')

prepare() {
  cd "$pkgname-$pkgver"
  # Arch has no /usr/libexec — point the packaged firecracker/jailer lookup
  # at /usr/lib/matchlock instead
  grep -q '/usr/libexec/matchlock' pkg/firecracker/paths_linux.go
  sed -i 's|/usr/libexec/matchlock|/usr/lib/matchlock|' pkg/firecracker/paths_linux.go
}

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

  # Pinned upstream firecracker + jailer static binaries (Apache-2.0)
  local _fcdir="$srcdir/release-v$_fcver-$CARCH"
  install -Dm755 "$_fcdir/firecracker-v$_fcver-$CARCH" \
    "$pkgdir/usr/lib/matchlock/firecracker"
  install -Dm755 "$_fcdir/jailer-v$_fcver-$CARCH" \
    "$pkgdir/usr/lib/matchlock/jailer"
  install -Dm644 "$_fcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.firecracker"
  install -Dm644 "$_fcdir/NOTICE" \
    "$pkgdir/usr/share/licenses/$pkgname/NOTICE.firecracker"
}
