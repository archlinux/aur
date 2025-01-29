# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: rawkode <rawkode@pm.me>

pkgname=openfaas-cli
pkgver=0.17.1
pkgrel=1
pkgdesc="Official CLI for OpenFaaS"
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
provides=('faas-cli')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2c0c5595201f686cface3064f5106bdaee3293a78df5151a8d0095d853214ff2')

prepare() {
  cd "${srcdir}/faas-cli-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/faas-cli-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go get -d -v ./...
  go build -o build ./...
}

package() {
  cd "${srcdir}/faas-cli-${pkgver}"
  install -Dm755 build/faas-cli "${pkgdir}/usr/bin/faas-cli"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
