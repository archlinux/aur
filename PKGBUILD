# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=fq
pkgver=0.0.2
pkgrel=1
license=('MIT')
pkgdesc="Tool, language and decoders for inspecting binary data."
depends=('glibc')
makedepends=('go' 'git')
arch=('x86_64')
url="https://github.com/wader/fq"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/wader/fq/archive/v${pkgver}.tar.gz")
sha256sums=('1bb7b968ba4ffe6f0dc8b080a2051719caebb96c244606468aecb2786640937b')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p dist/
}

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" ${_BUILDINFO}" \
    -o dist/fq \
    .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 dist/$pkgname "${pkgdir}/usr/bin/$pkgname"
  install -D -m644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

