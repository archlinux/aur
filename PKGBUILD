# Maintainer: Ben Woodward <ben@benwoodward.me.uk>

pkgname=pulumi-language-java
_reponame=pulumi-java
pkgver=0.9.9
pkgrel=1
pkgdesc='Modern Infrastructure as Code (YAML provider)'
arch=('x86_64')
url="https://github.com/pulumi/$_reponame"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$_reponame-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e49c5f5bc0446ad6be5eee7d5de88c9319efbf3c88e338bd1c117a5e65b8d95a')
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
