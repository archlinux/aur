# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: rawkode <rawkode@pm.me>

pkgname=openfaas-cli
pkgdesc="Official CLI for OpenFaaS"
pkgver=0.12.4
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('faas-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('97b160056033b53103318def3a10735297a28afc52a50da0105e3aad4f570055')

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
  install -Dm755 build/faas-cli-${pkgver} "${pkgdir}/usr/bin/faas-cli"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}