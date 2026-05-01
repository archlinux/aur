# Maintainer: Markus <github@marang.dev>
pkgname=bootrecov
pkgver=0.2.0
pkgrel=1
pkgdesc='TUI/CLI helper to manage mirrored /boot backups and GRUB recovery entries'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/bootrecov'
license=('MIT')
depends=('rclone' 'grub' 'squashfs-tools')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6fa94ff7f3de28bbabd755ece86d6e906f674a4ce2478e1da6a845e154e85989')

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
