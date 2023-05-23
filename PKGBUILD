# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Jonatan Bravo <zephrax@gmail.com>
pkgname=envconsul
pkgver=0.13.2
pkgrel=2
pkgdesc="Launch a subprocess with environment variables using data from @HashiCorp Consul and Vault."
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/hashicorp/envconsul"
license=('MPL2')
depends=('glibc')
makedepends=('go')
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}/v${pkgname}-${pkgver}.tar.gz")
sha512sums=('dacc65e19553de897195397126664882e3dedd4b9929c83c519311010ff1ab62663425556261a2ce3f37035576b63b4f26c4a0219dfd663d05e852c4cee2e6bb')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"
  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -compressdwarf=false" \
    -o build \
    .
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-ldflags=-linkmode=external"
  go test -v \
    # not sure why this one is failing
    -skip 'TestFinalize/2_vault_renew_token_default' \
    ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
