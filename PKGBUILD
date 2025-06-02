# Maintainer: Christian Bardey (Nordwin)
# Contributor: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_pkgauthor=laktak
pkgname=chkbit
pkgver=6.4.0
pkgrel=2
pkgdesc="Check your files for data corruption and deduplicate."
url="https://github.com/${_pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${pkgname}/v${pkgver}"
arch=('x86_64' 'arm64' 'riscv64')
license=('MIT')
provides=("${pkgname}")
makedepends=('go' 'help2man')
source=("https://github.com/$_pkgauthor/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('99a69e05172ed27f0cf60d4aa967bc3f00a34f49c0d6529f6df41242cab789f8')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "$srcdir/$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
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

