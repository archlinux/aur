# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-swiftnp
# renovate: datasource=github-releases depName=bmuschko/kubectl-swiftnp
pkgver=0.1.0
pkgrel=4
pkgdesc='kubectl plugin for rendering details of network policies'
arch=('x86_64' 'aarch64')
url='https://github.com/bmuschko/kubectl-swiftnp'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5a8acef8fd3f1b0460331b73228260c30d30ab88a0674cfc407fd2d0754f79e740a99689f62b0a47ddd13f4e73035f9ad070215590e48de9e81b025ce2029400')
b2sums=('68276c528cb781754015018e081528d2c12fe6bad348806f05cee71304392be52a91f95258065a7ede683a1644d52472b2b40d99b48eefa298ce34b2c6b37396')

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
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -v"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"
  go build \
    -ldflags="${_x[*]/#/-X=${url/https:\/\/}/pkg/version.} -linkmode external" \
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

  for i in *.adoc
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
