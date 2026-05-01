# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.4.0
pkgrel=1
pkgdesc='TUI/CLI helper for /boot recovery snapshots and bootloader fallback entries'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/bootrecov'
license=('MIT')
depends=('rclone' 'grub' 'squashfs-tools')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f39b398b68ba9427744dec7aab8f319fccd0a4117bb9d121fa05909d63369479')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  go mod download
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  go build -trimpath -mod=readonly -ldflags "-s -w" -o bootrecov ./cmd/bootrecov
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 bootrecov "${pkgdir}/usr/bin/bootrecov"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
