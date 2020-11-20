# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hoverfly
pkgver=1.3.1
pkgrel=1
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers"
arch=('x86_64')
url='https://hoverfly.io'
license=('Apache')
provides=('hoverfly')
conflicts=('hoverfly-bin' 'hoverfly-git')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SpectoLabs/hoverfly/archive/v${pkgver}.tar.gz")
sha256sums=('950bcda9aac38406053ff732fffebb23a2117a50e4fcc0bb10a5dac93e1545bf')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/hoverctl -t "${pkgdir}/usr/bin"
  install -Dm755 build/hoverfly -t "${pkgdir}/usr/bin"
}
