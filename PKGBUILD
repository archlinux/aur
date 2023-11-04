# Maintainer: Ben Woodward <ben@benwoodward.me.uk>

pkgname=pulumi-language-java
_reponame=pulumi-java
pkgver=0.9.8
pkgrel=1
pkgdesc='Modern Infrastructure as Code (YAML provider)'
arch=('x86_64')
url="https://github.com/pulumi/$_reponame"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$_reponame-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('0fb0f9beed326f94e712c756993b3b8faea2cdc08d754451a2287deccd4951707afa3484b7027093e6fc0ef7525b0e5f24501e4a28c628fd451d5eed20adafce')
options=('!lto') # disable as soon as LTO problems are resolved

build() {
  cd "${srcdir}/${_reponame}-${pkgver}/pkg"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Build the `pulumi-language-java` executable
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
