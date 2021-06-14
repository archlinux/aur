# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=nomad-driver-podman
pkgver=0.2.0
pkgrel=1
pkgdesc="A nomad taskdriver for podman containers"
arch=('x86_64')
url="https://github.com/hashicorp/nomad-driver-podman"
license=('MPL2')
depends=('nomad' 'glibc' 'podman')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('5a1c53248cc0cc08579d308260f6a34ea6f40c68b60a2c902938f13d6bccd21409e6cb040286bbb29d3c1668f21eedaf29cc782901971cf803e89d445da9fa25')

prepare() {
	cd "$pkgname-$pkgver"
  mkdir build
}

build() {
	cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    .
}

package() {
	cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/var/lib/nomad/plugins" "build/$pkgname"
}
