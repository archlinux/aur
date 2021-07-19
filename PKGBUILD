# Maintainer: Hao Long <aur@esd.cc>

pkgname=platypus
pkgver=1.5.0
pkgrel=1
pkgdesc="A modern multiple reverse shell sessions manager written in go"
arch=("x86_64" "i686")
url="https://github.com/WangYihang/Platypus"
license=("LGPL3")
depends=("glibc")
makedepends=("go" "yarn" "go-bindata" "python" "nodejs-lts-erbium")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('50080df26d599d5fbbe8aea31ffe3fe0f6c2cd6ca8f5c8dd9a2296a44e4d4067')

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
  go build -o platypus platypus.go
}

package() {
  cd Platypus-${pkgver}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
