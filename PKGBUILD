# Maintainer: Ben Woodward <ben@benwoodward.me.uk>

pkgname=pulumi-language-dotnet
_reponame=pulumi-dotnet
pkgver=3.59.0
pkgrel=1
pkgdesc='Modern Infrastructure as Code (Dotnet provider)'
arch=('x86_64')
url="https://github.com/pulumi/$_reponame"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$_reponame-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eb813182a7f0ca1e2e869716802228c97dbcb8fd6ebb22fb5b85ec2424485ad2')
options=('!lto') # disable as soon as LTO problems are resolved

build() {
  cd "${srcdir}/${_reponame}-${pkgver}/${pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Build the `pulumi-language-dotnet` executable
  go build \
    -ldflags "-X github.com/pulumi/${_reponame}/pkg/v${pkgver%%.*}/version.Version=${pkgver} -extldflags ${LDFLAGS}" \
    -o "${srcdir}/${_reponame}-${pkgver}/bin/${pkgname}" \
    "." 
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  # Install the executable
  install -D -m 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
