# Maintainer: Maximilian Bräutigam <m.braeutigam@gdch.de>

pkgname=grutil
pkgver=0.4.0.r91.40d3ba7
pkgrel=1
pkgdesc="GraphQL CLI utility, works with GraphCMS"
arch=('i686' 'x86_64')
url="https://github.com/arroyo/grutil.git"
license=('MIT')
makedepends=('go' 'git')
provides=('grutil')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  echo "$(git describe --tags --abbrev=0 | sed 's/^v//').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p "${srcdir}/gopath/"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath/"
  
  cd "$srcdir/$pkgname"
  GO111MODULE=on go build -o "$pkgname"
  go clean -modcache
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
