# Maintainer: Nikhil Iyer <iyer.h.nikhil at gmail dot com>

pkgname="nhost"
pkgrel=1
pkgver=1.50.0
pkgdesc="Used to set up a local development environment with Nhost. This environment will automatically track database migrations and Hasura metadata."
arch=('x86_64')
url="https://github.com/nhost/nhost"
license=("MIT")
depends=("docker" "curl" "docker-compose")
makedepends=('go' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
options=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/cli@${pkgver}.tar.gz")
sha256sums=('15a38b50f97f003de83dec2aac0f7e17c237e31cb922de6d99e06efd1eb9f5db')

build() {
  cd "$srcdir/${pkgname}-cli-${pkgver}/cli"

  export OS=linux

  export CGO_ENABLED="1"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-s -w -X main.Version=${pkgver} -linkmode external" \
    -o "build/${pkgname}" \
    .
}

package() {
  cd "${srcdir}/${pkgname}-cli-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "cli"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
