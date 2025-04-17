# Maintainer: Khaled Rouissi <your.email@example.com>

pkgname=ma7rath
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, elegant command-line timer application"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/khalidrouissi1/ma7rath"
license=('MIT')
depends=()
makedepends=('go>=1.16')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP') # Replace with actual checksum when available

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname}" -ldflags "-s -w" .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install license - make sure LICENSE exists in the source repository
  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  elif [ -f "../LICENSE" ]; then
    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  # Install documentation - make sure README.md exists in the source repository
  if [ -f "README.md" ]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  fi
}
