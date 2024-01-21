# Maintainer: Ben Woodward <ben@benwoodward.me.uk>

pkgname=pulumi-language-yaml
_reponame=pulumi-yaml
pkgver=1.4.5
pkgrel=1
pkgdesc='Modern Infrastructure as Code (YAML provider)'
arch=('x86_64')
url="https://github.com/pulumi/$_reponame"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$_reponame-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('d09decad924f896aad7606ca59f7c02fc2016c69e3df42702ba2495a9d8a6ab54efdd9c10f4a6a49cb6822ec23f639b70779b794be148f248e6389ac371d9676')
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
    -ldflags "-X github.com/pulumi/${_reponame}/pkg/v${pkgver%%.*}/version.Version=${pkgver} -extldflags ${LDFLAGS}" \
    -o "${srcdir}/${_reponame}-${pkgver}/bin/${pkgname}" \
    "./cmd/${pkgname}" 
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  # Install the executable
  install -D -m 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
