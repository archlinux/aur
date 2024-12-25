# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: rawkode <rawkode@pm.me>

pkgname=openfaas-cli
pkgver=0.16.38
pkgrel=1
pkgdesc="Official CLI for OpenFaaS"
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
provides=('faas-cli')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('76b6990376aa510d993f8fc973f55d5bfbd9171689edc0a7fd92b8dfe3579ea3')

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
