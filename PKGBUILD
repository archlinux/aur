# Maintainer: fubarhouse
pkgname=pygmy-git
cleanname=pygmy
provides=(pygmy)
pkgver=v0.13.1.r6.g729809b
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/pygmystack/pygmy"
license=('MIT')
conflicts=(pygmy pygmy-bin pygmy-go pygmy-go-bin pygmy-go-git)
makedepends=(git go-pie)
source=("$pkgname::git+https://github.com/pygmystack/pygmy.git")
sha512sums=('SKIP')

pkgver() {
  cd "${cleanname}-git"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${cleanname}-git"
  go mod vendor
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -v \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o ${cleanname} \
    .
}

package() {
  cd "${srcdir}/${cleanname}-git" || exit 1
  install -Dm755 "$cleanname" "$pkgdir/usr/bin/$cleanname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$cleanname/LICENSE"
}
