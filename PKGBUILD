# Maintainer: Hao Long <aur@esd.cc>

pkgname=ksubdomain
pkgver=0.7
pkgrel=1
pkgdesc="无状态子域名爆破工具"
arch=("x86_64" "i686")
url="https://github.com/knownsec/ksubdomain"
license=("MIT")
depends=("libpcap")
makedepends=("go" "statik")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('fe6f793e028c346d23c55d1231e622efe615890c45f12f35f231c762a1f282a8f5289d02bf12688694098989ae5e3ab9ac0e0c63d30adbe5e28fe9e08b4d0e83')

prepare() {
  cd ${pkgname}-${pkgver}
  statik -src=resources
}

build() {
  cd ${pkgname}-${pkgver}/cmd
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ../${pkgname} .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
