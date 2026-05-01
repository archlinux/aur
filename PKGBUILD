# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.4.2
pkgrel=1
pkgdesc='TUI/CLI helper for /boot recovery snapshots and bootloader fallback entries'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/bootrecov'
license=('MIT')
depends=('rclone' 'grub' 'squashfs-tools')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d31dcfcd534e05a92fe5527aed59687a1303a44bb8126e5713d0ef3dff5477c6')

_make_go_modcache_writable() {
  if [[ -n "${GOMODCACHE:-}" && -d "${GOMODCACHE}" ]]; then
    chmod -R u+w "${GOMODCACHE}" 2>/dev/null || true
  fi
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  export GOFLAGS="-modcacherw"
  trap _make_go_modcache_writable EXIT
  go mod download
  _make_go_modcache_writable
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  export GOFLAGS="-modcacherw"
  trap _make_go_modcache_writable EXIT
  go build -trimpath -mod=readonly -ldflags "-s -w" -o bootrecov ./cmd/bootrecov
  _make_go_modcache_writable
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 bootrecov "${pkgdir}/usr/bin/bootrecov"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
