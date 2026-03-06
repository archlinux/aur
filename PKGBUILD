# Maintainer: Christian Bardey (Nordwin)
# Contributor: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>
# Based on the PKGBUILD by Rafael Baboni Dominiquini

_pkgauthor=laktak
pkgname=chkbit
pkgver=6.6.0
pkgrel=1
pkgdesc="Check your files for data corruption and deduplicate."
url="https://github.com/${_pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${pkgname}/v${pkgver}"
arch=('x86_64' 'arm64' 'riscv64')
license=('MIT')
provides=("${pkgname}")
makedepends=('go' 'help2man')
options=('!debug')
source=("https://github.com/$_pkgauthor/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69a5c709d78604ed9d21b5439b2fbae96e21f729d7d36f417d50348dc9fdcc81')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.appVersion=$pkgver" \
    ./cmd/${pkgname}

  help2man ./${pkgname} --output "${pkgname}.1" --no-info
  gzip -f "${pkgname}.1"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}

