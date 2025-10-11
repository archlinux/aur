# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-terminate
# renovate: datasource=github-releases depName=xcoulon/kubectl-terminate
pkgver=0.1.0
pkgrel=2
pkgdesc='kubectl plugin to remove finalizers and finally delete k8s resources'
arch=('x86_64' 'aarch64')
url='https://github.com/xcoulon/kubectl-terminate'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('20db19ac7b36979fe69a5007f831d92852c8932ffca2453f8926a144d03b218b09a313f0ded5a98aa50e5964b28d7d966c371fbe2424d13f4d474a44fda3c1ce')
b2sums=('6794ee063f098aee26c34a0656dcb8b9a3bdfdc38e45f947536c18caf8f4d8ee8c9d6805158fe4cd67df27d1f2e1b58231302fa91d74ce89c7b4cbbaf3cb9686')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
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
  install -Dm755 "bin/cmd" "${pkgdir}/usr/bin/${pkgname}"

  for i in *.adoc
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
