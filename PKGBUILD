# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.5.2
pkgrel=1
pkgdesc='TUI/CLI helper for /boot recovery snapshots and bootloader fallback entries'
arch=('x86_64' 'aarch64')
url="https://entire.com/et/marang/bootrecov"
license=('MIT')
depends=('rclone' 'grub' 'squashfs-tools' 'file')
makedepends=('go>=1.26.10')
options=('!debug')
install="${pkgname}.install"
_commit=137fae407daa59b57c76e07eeb9cc5c9419648e5
source=("bootrecov-$pkgver.tar.gz::https://get.izoone.com/bootrecov/v$pkgver/bootrecov-137fae407daa59b57c76e07eeb9cc5c9419648e5.tar.gz")
sha256sums=('77795b5b9157c6bfa2899e06c07d4f146667cd53a9e68c1a464332f3badb4c0a')

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
  cd "bootrecov-137fae407daa59b57c76e07eeb9cc5c9419648e5"
  _export_go_build_env
  trap _make_go_caches_writable EXIT
  CGO_ENABLED=0 go build "${_go_build_flags[@]}" -ldflags="${_go_ldflags[*]}" -o bootrecov ./cmd/bootrecov
  _make_go_caches_writable
}

check() {
  cd "bootrecov-137fae407daa59b57c76e07eeb9cc5c9419648e5"
  _export_go_build_env
  trap _make_go_caches_writable EXIT
  CGO_ENABLED=0 go test "${_go_build_flags[@]}" -count=1 ./...
  _make_go_caches_writable
}

package() {
  cd "bootrecov-137fae407daa59b57c76e07eeb9cc5c9419648e5"
  install -Dm755 bootrecov "${pkgdir}/usr/bin/bootrecov"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
