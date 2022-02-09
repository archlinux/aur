# Maintainer: tywyqu <tywyqu[at]hi2[dot]in>
pkgname=storj-uplink-git
_basename=storj
pkgver=1.48.2
pkgrel=1
pkgdesc="Storj Tardigrade Uplink"
arch=('x86_64')
url="https://github.com/storj/storj"
license=(' AGPL-3.0')
source=("git+${url}")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'go')
sha512sums=('SKIP')

pkgver() {
  cd "${_basename}"
  git describe --tags `git rev-list --tags --max-count=1` | grep -m1 -Eo '[0-9]\.[0-9]*\.[0-9]'
}

prepare(){
    mkdir -p build
    cd "${_basename}"
    git checkout -f -B v${pkgver}
}

build() {
    cd "$_basename"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o ../build ./cmd/uplink
}

package() {
    install -Dm755 build/uplink "${pkgdir}/usr/bin/uplink"
    install -Dm644 ${_basename}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
