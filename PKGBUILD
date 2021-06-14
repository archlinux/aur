# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=nomad-driver-lxc
pkgver=0.3.0
pkgrel=1
pkgdesc="A nomad taskdriver for lxc containers"
arch=('x86_64')
url="https://github.com/hashicorp/nomad-driver-lxc"
license=('MPL2')
depends=('nomad' 'glibc' 'lxc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('615ec5472597b77e8c1f949eed15a366c2a317fe288a0d29f36860e83e1528e4f9397f4ec30877cca19c7f90d2996f74f8ef988d0ae82da6528745e0fa4dfe20')

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
