# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: rawkode <rawkode@pm.me>

pkgname=openfaas-cli
pkgver=0.13.9
pkgrel=1
pkgdesc="Official CLI for OpenFaaS"
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
provides=('faas-cli')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('bd4205d87d744b2ece2e6b5b5c541166a568551854eed0188cc32388e4a71be4')

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
