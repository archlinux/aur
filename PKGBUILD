# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.4.13
pkgrel=1
pkgdesc='TUI/CLI helper for /boot recovery snapshots and bootloader fallback entries'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/bootrecov'
license=('MIT')
depends=('rclone' 'grub' 'squashfs-tools' 'file')
makedepends=('go')
options=('!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d14f48b5ae0281e0872751e88720a92cf2f0980ad50b9a0cb0dc1f4aafb8449b')

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
