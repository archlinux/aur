# Maintainer: Hao Long <aur@esd.cc>

pkgname=platypus
pkgver=1.3.8
pkgrel=1
pkgdesc="A modern multiple reverse shell sessions manager written in go"
arch=("x86_64" "i686")
url="https://github.com/WangYihang/Platypus"
license=("LGPL3")
depends=("glibc")
makedepends=("go" "yarn" "go-bindata")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('66d6adc8ed5074189f0e625da5d1496fe65b436db05e7fb9fd0a06491e69dda0')

build() {
  cd Platypus-${pkgver}
  cd html/frontend && yarn && yarn build && cd ../../
  cd html/ttyd && yarn && yarn build && cd ../../
  go-bindata -pkg resource -o ./lib/util/resource/resource.go ./lib/runtime/... ./html/ttyd/dist/... ./html/frontend/build/...
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd Platypus-${pkgver}
  install -Dm755 Platypus ${pkgdir}/usr/bin/${pkgname}
}
