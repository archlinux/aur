# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=nomad-driver-containerd
_pkgname=containerd-driver
pkgver=0.8
pkgrel=1
pkgdesc="A nomad taskdriver for containerd containers"
arch=('x86_64')
url="https://github.com/Roblox/nomad-driver-containerd"
license=('MPL2')
depends=('nomad' 'glibc' 'containerd')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ad1d8dec8351b6e4c852119c60d8f00a2a4ca66183036fc189dc9ab54ff5792f3d9989a67792c61ebb2c439fabf409814526d117f9826cc1a2bf6b69bd11c5ce')

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
  install -vDm755 "build/$pkgname" "$pkgdir/var/lib/nomad/plugins/$_pkgname"
}
