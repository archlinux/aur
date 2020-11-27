# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>

pkgname=fluxcd-flux
pkgver=0.4.1
pkgrel=2
pkgdesc="Open and extensible continuous delivery solution for Kubernetes."
url="https://fluxcd.io/"
arch=("x86_64" "armv6h" "armv7h" "aarch64")
license=("APACHE")
depends=('glibc')
makedepends=("go")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/archive/v$pkgver.tar.gz"
)
sha512sums=(
  'feb48c43a4c8e5d891f892219f95345e051adec2222708de1d4f743e2208ae961c63f6f08075f6e7d5ad383226b664c04fad10dd4c0f84762d8f5b97894c9f0b'
)

build() {
  cd "flux2-$pkgver"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o flux-bin ./cmd/flux
}

check() {
  cd "flux2-$pkgver"
  make test
}

package() {
	cd "flux2-$pkgver"
	install -Dm755 flux-bin "$pkgdir/usr/bin/flux"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
