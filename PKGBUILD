# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-explore
# renovate: datasource=github-releases depName=keisku/kubectl-explore
pkgver=0.14.0
pkgrel=2
pkgdesc='plugin for kubectl that gives you a UNIX find-like experience'
arch=('x86_64' 'aarch64')
url='https://github.com/keisku/kubectl-explore'
license=('Apache-2.0')
depends=('kubectl' 'glibc' 'bash')
makedepends=('go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a34080f4d0d7c462eddfad1da8dd364455a460937c86f49f1448e3a277d2cfabf3bced009e0eb08abd38cb1d4cce9d7bfa15966ae587367b36150ec4a21990a2')
b2sums=('d99d11fe3feb8a9d1c9ef26a7ca31fd90feb63388097e2df19c6de43802ee4c4faff0a32a46cf182b91538bd0122addc9b88893e61bd31e2a4bf26ee969df3cb')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
    date="$(date +%F)"
  )

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"
  go build -v \
    -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
