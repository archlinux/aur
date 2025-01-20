# Maintainer: Ben Woodward <ben@benwoodward.me.uk>

pkgname=pulumi-language-yaml
_reponame=pulumi-yaml
pkgver=1.13.0
pkgrel=1
pkgdesc='Modern Infrastructure as Code (YAML provider)'
arch=('x86_64')
url="https://github.com/pulumi/$_reponame"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$_reponame-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f547f5292ff73a5f93f3ed36fc315097d36a73154c7ab5d5dde3772e42957855')
options=('!lto') # disable as soon as LTO problems are resolved

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Build the `pulumi-language-yaml` executable
  go build \
    -ldflags "-X github.com/pulumi/${_reponame}/pkg/v${pkgver%%.*}/version.Version=${pkgver}" \
    -o "${srcdir}/${_reponame}-${pkgver}/bin/${pkgname}" \
    "./cmd/${pkgname}"
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  # Install the executable
  install -D -m 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
