pkgname=pastebox-cli
pkgver=26.07.20
pkgrel=1
pkgdesc="Lightweight command-line client for self-hosted Pastebox servers"
arch=('x86_64' 'aarch64')
url="https://github.com/kmw0410/pastebox-cli"
license=('MIT')
makedepends=('go>=1.26.4')
_tag=v26.07.20
_commit=6618f2b
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('d5f4760224fd69b7c00b2b9ced8b7341da721cb5cc412c02e642873c18357275')

build() {
  cd "${pkgname}-${_tag#v}"

  CGO_ENABLED=0 go build \
    -buildvcs=false \
    -trimpath \
    -ldflags "-s -w -X main.version=${_tag} -X main.commit=${_commit}" \
    -o pb .
}

check() {
  cd "${pkgname}-${_tag#v}"

  CGO_ENABLED=0 go test -buildvcs=false ./...
}

package() {
  cd "${pkgname}-${_tag#v}"

  install -Dm755 pb "${pkgdir}/usr/bin/pb"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 package.md "${pkgdir}/usr/share/doc/${pkgname}/package.md"
  install -Dm644 package_ko.md "${pkgdir}/usr/share/doc/${pkgname}/package_ko.md"
}
