# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.4.18
pkgrel=1
pkgdesc='TUI/CLI helper for /boot recovery snapshots and bootloader fallback entries'
arch=('x86_64' 'aarch64')
url="https://automation.izoone.com/releases/bootrecov"
license=('MIT')
depends=('rclone' 'grub' 'squashfs-tools' 'file')
makedepends=('go>=1.26.10')
options=('!debug')
install="${pkgname}.install"
_commit=596fe93567a12b4f29ee1bdffbcf36cdea6bae8c
source=("bootrecov-$pkgver.tar.gz::$url/v$pkgver/bootrecov-596fe93567a12b4f29ee1bdffbcf36cdea6bae8c.tar.gz")
sha256sums=('4c42371cfe9629bc89bdcf10c900aacf6b9100138160335e8a8072db1951fe31')

_export_go_build_env() {
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  export GOCACHE="${srcdir}/gocache"
  export GOFLAGS="-modcacherw -p=1"
}

_make_go_caches_writable() {
  if [[ -n "${GOMODCACHE:-}" && -d "${GOMODCACHE}" ]]; then
    chmod -R u+w "${GOMODCACHE}" 2>/dev/null || true
  fi
  if [[ -n "${GOCACHE:-}" && -d "${GOCACHE}" ]]; then
    chmod -R u+w "${GOCACHE}" 2>/dev/null || true
  fi
}

_go_build_flags=(-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw)
_go_ldflags=(-s -w -buildid=)

build() {
  cd "bootrecov-596fe93567a12b4f29ee1bdffbcf36cdea6bae8c"
  _export_go_build_env
  trap _make_go_caches_writable EXIT
  CGO_ENABLED=0 go build "${_go_build_flags[@]}" -ldflags="${_go_ldflags[*]}" -o bootrecov ./cmd/bootrecov
  _make_go_caches_writable
}

check() {
  cd "bootrecov-596fe93567a12b4f29ee1bdffbcf36cdea6bae8c"
  _export_go_build_env
  trap _make_go_caches_writable EXIT
  CGO_ENABLED=0 go test "${_go_build_flags[@]}" -count=1 ./...
  _make_go_caches_writable
}

package() {
  cd "bootrecov-596fe93567a12b4f29ee1bdffbcf36cdea6bae8c"
  install -Dm755 bootrecov "${pkgdir}/usr/bin/bootrecov"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
