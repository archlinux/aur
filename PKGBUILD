# Maintainer: Brody <archfan at brodix dot de>

pkgname=directpv
pkgdesc='MinIO DirectPV'
pkgver=4.1.4
pkgrel=1
arch=(x86_64)
url=https://min.io/docs/directpv/
license=(AGPL-3.0-only)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/minio/directpv/tar.gz/refs/tags/v${pkgver})
sha256sums=('1285f3766857bd170426f73e63aa76641630580108c52e3391f29f609815bdde')

prepare() {
  export GOPATH="${srcdir}"

  cd ${pkgname}-${pkgver}
  rm -rf out

  go mod tidy
}


build() {
  local _flags
  _flags=(
    -X=main.version=v${pkgver}
    -linkmode=external
  )

  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd ${pkgname}-${pkgver}

  go build \
    -o out/${pkgname} \
    -ldflags="${_flags[*]}" \
    ./cmd/${pkgname}
  go build \
    -o out/kubectl-${pkgname} \
    -ldflags="${_flags[*]}" \
    ./cmd/kubectl-${pkgname}
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 -t "${pkgdir}"/usr/bin \
    out/{,kubectl-}${pkgname}
}

# vim: ts=2 sw=2 et:
