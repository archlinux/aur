# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.4.4
pkgrel=1
pkgdesc='TUI/CLI helper for /boot recovery snapshots and bootloader fallback entries'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/bootrecov'
license=('MIT')
depends=('rclone' 'grub' 'squashfs-tools')
makedepends=('go')
options=('!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('026006a41df40206bb57be5280c3dcd68116532ce4bade72699a4454633840f7')

_export_go_build_env() {
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  export GOCACHE="${srcdir}/gocache"
  export GOFLAGS="-modcacherw"
}

_make_go_caches_writable() {
  if [[ -n "${GOMODCACHE:-}" && -d "${GOMODCACHE}" ]]; then
    chmod -R u+w "${GOMODCACHE}" 2>/dev/null || true
  fi
  if [[ -n "${GOCACHE:-}" && -d "${GOCACHE}" ]]; then
    chmod -R u+w "${GOCACHE}" 2>/dev/null || true
  fi
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _export_go_build_env
  trap _make_go_caches_writable EXIT
  go mod download
  _make_go_caches_writable
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _export_go_build_env
  trap _make_go_caches_writable EXIT
  go build -trimpath -mod=readonly -ldflags "-s -w" -o bootrecov ./cmd/bootrecov
  _make_go_caches_writable
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 bootrecov "${pkgdir}/usr/bin/bootrecov"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
