# Maintainer: robertfoster
# Contributor: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=aptly
pkgver=1.5.0
pkgrel=1
pkgdesc="A Swiss Army knife for Debian repository management."
url="https://www.aptly.info"
license=('MIT')
options=('!strip')
arch=('i686' 'x86_64')
makedepends=('go')
source=("https://github.com/aptly-dev/aptly/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export GO11MODULE=on
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"
  go build -o aptly_build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}_build" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}.service" \
    -t "${pkgdir}/usr/lib/systemd/system"

  install -Dm644 completion.d/aptly \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 completion.d/_aptly \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 man/aptly.1 \
    "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

sha256sums=('07e18ce606feb8c86a1f79f7f5dd724079ac27196faa61a2cefa5b599bbb5bb1')
