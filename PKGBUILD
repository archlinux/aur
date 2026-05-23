# Maintainer: lemachinarbo <your@email.com>
pkgname=ddev-clim
pkgver=0.3.0
pkgrel=1
pkgdesc="Advanced Terminal UI for managing DDEV instances"
arch=('x86_64' 'aarch64')
url="https://github.com/lemachinarbo/ddev-clim"
license=('MIT')
depends=('ddev' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export MISE_TRUSTED_CONFIG_PATHS="$PWD"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o "$pkgname" main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ddev-clim.service "$pkgdir/usr/lib/systemd/user/ddev-clim.service"
}
sha256sums=('4c1af560d5ec164c540c8613d29f8b62236dae6a2238ef3548853d9b1cd9e58c')
