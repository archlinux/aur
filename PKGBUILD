# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.5.0
pkgrel=1
pkgdesc='TUI/CLI helper for /boot recovery snapshots and bootloader fallback entries'
arch=('x86_64' 'aarch64')
url="https://automation.izoone.com/releases/bootrecov"
license=('MIT')
depends=('rclone' 'grub' 'squashfs-tools' 'file')
makedepends=('go>=1.26.10')
options=('!debug')
install="${pkgname}.install"
_commit=17867977094a36caf108880e807692b0a8f8c805
source=("bootrecov-$pkgver.tar.gz::$url/v$pkgver/bootrecov-17867977094a36caf108880e807692b0a8f8c805.tar.gz")
sha256sums=('aae7d2030e13f09b70cda9c35cd67d580d6d57352b0a0025b4f62d393d91ef4f')

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
  cd "bootrecov-17867977094a36caf108880e807692b0a8f8c805"
  _export_go_build_env
  trap _make_go_caches_writable EXIT
  CGO_ENABLED=0 go build "${_go_build_flags[@]}" -ldflags="${_go_ldflags[*]}" -o bootrecov ./cmd/bootrecov
  _make_go_caches_writable
}

check() {
  cd "bootrecov-17867977094a36caf108880e807692b0a8f8c805"
  _export_go_build_env
  trap _make_go_caches_writable EXIT
  CGO_ENABLED=0 go test "${_go_build_flags[@]}" -count=1 ./...
  _make_go_caches_writable
}

package() {
  cd "bootrecov-17867977094a36caf108880e807692b0a8f8c805"
  install -Dm755 bootrecov "${pkgdir}/usr/bin/bootrecov"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
