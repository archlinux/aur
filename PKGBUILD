# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=nomad-driver-singularity
_pkgver=1.0.0-alpha2
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="A nomad taskdriver for singularity containers"
arch=('x86_64')
url="https://github.com/hpcng/nomad-driver-singularity"
license=('MPL2')
depends=('nomad' 'singularity-container')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
b2sums=('26624229001ff193167ef93482f5627c09786383a1c357b98a88a1404fbedc401867fcc559f9c58b8981fc121096727e60d087e0cd6d2a1329525b9ab8ad29d8')

prepare() {
	cd "$pkgname-$_pkgver"
  mkdir build
}

build() {
	cd "$pkgname-$_pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    ./cmd/...
}

package() {
	cd "$pkgname-$_pkgver"
  install -vDm755 build/driver "$pkgdir/var/lib/nomad/plugins/$pkgname"
}
