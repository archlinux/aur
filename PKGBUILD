# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=sops
pkgver=3.3.0
pkgrel=1
pkgdesc='Editor of encrypted files that supports YAML, JSON and BINARY formats'
arch=('i686' 'x86_64')
url='https://github.com/mozilla/sops'
license=('MPL2')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ba9cf4dffeba97ae738a71b1f647780ef71e01466e1fe5a9b61bca5e89d25a19')

prepare() {
  mkdir -p src/go.mozilla.org
  mv ${pkgname}-${pkgver} src/go.mozilla.org/sops
}

build() {
  cd src/go.mozilla.org/sops
  env GOPATH="${srcdir}" go build \
    -asmflags all="-trimpath=${PWD}" \
    -gcflags all="-trimpath=${PWD}" \
    -ldflags all="-extldflags=${LDFLAGS}" \
    ./cmd/sops
}

check() {
  cd src/go.mozilla.org/sops
  env GOPATH="${srcdir}" go test
}

package() {
  cd src/go.mozilla.org/sops
  install -Dm755 sops "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
