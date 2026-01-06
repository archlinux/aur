# Maintainer: Nikhil Iyer <iyer.h.nikhil at gmail dot com>

pkgname="nhost"
pkgrel=1
pkgver=1.34.12
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
sha256sums=('eb484b97af53f84fcc8072974169e60e253980a4bfcbd42e78dc3835c280eb03')

pkgver() {
  git ls-remote --sort "version:refname" ${url}.git "cli@*" | grep -E 'cli@([0-9]+\.[0-9]+\.[0-9]+)$' | tail -n 1 | sed -E 's/^.*cli@([0-9]+\.[0-9]+\.[0-9]+)$/\1/g'
}

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
