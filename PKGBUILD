# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-dfi
# renovate: datasource=github-releases depName=makocchi-git/kubectl-dfi
pkgver=0.1.2
pkgrel=2
pkgdesc='Print disk usage of container image on Kubernetes node(s) like a linux "df" command'
arch=('x86_64' 'aarch64')
url='https://github.com/makocchi-git/kubectl-dfi'
license=('MIT')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a36c841aaddb13ca69a4f40073d5cbf6a2c785e2ab24b5b1c22cc2acc3ff6f3e5be8acd27b147335aef43599a7c01c5e8db2753bf495d5eaa555338965d106a7')
b2sums=('8576c3a8e590ef77df79b45b352b1d78e74a77994395ded5b09539ca809943f9de72ae1a637abe30f90efebe9a6674fee9d0398e59567f411d06f53b3554bcc0')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    date="$(date +%s)"
    version="v${pkgver}"
    commit="${_commit:?}"
  )

  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on
  export GOPROXY=direct
  # -ldflags="-linkmode=external ${_x[*]/#/-X=${url/https:\/\/}/pkg/util.}" \
  # We don't need the linter, it causes dependency resolution problems
  sed -i \
    -e '/github.com\/golangci\/golangci-lint/d' \
    go.mod
  go mod tidy

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " ${value} " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  mkdir bin
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

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
