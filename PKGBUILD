# Maintainer: Hao Long <aur@esd.cc>

pkgname=platypus
pkgver=1.3.4
pkgrel=1
pkgdesc="A modern multiple reverse shell sessions manager written in go"
arch=("x86_64" "i686")
url="https://github.com/WangYihang/Platypus"
license=("LGPL3")
depends=("glibc")
makedepends=("go" "yarn" "go-bindata")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f0669fe0adca0010115ecd9c21222be7dd72c85d000dd7bd19467b5d338d352b')

build() {
  cd Platypus-${pkgver}/html
  yarn install
  yarn build
  cd ..
  go-bindata -pkg resource -o ./lib/util/resource/resource.go ./lib/runtime/... ./html/dist
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
