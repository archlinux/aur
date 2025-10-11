# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-count
# renovate: datasource=github-releases depName=chenjiandongx/kubectl-count
pkgver=0.2.6
pkgrel=4
pkgdesc='kubectl plugin to list and count resources by kind'
arch=('x86_64' 'aarch64')
url='https://github.com/chenjiandongx/kubectl-count'
license=('MIT')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9754a69f8c5c3f9bec3f1e8b02a0937381a410a23d213fc00318b5e10a3f930a9574b322c4ae3435a9747ae5dc939fbf5644331b636c689630628d014bd02477')
b2sums=('b168edebef6da091b341a999440f16dd7e98fba2654ab11232f48b96b2588ac04fc78130ccc8af97c124f7a4413b4315ed596f1940ba0a596f169acb98f880c2')

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

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
