# Maintainer: Fuero <fuerob@gmail.com>

pkgname=kor
# renovate: datasource=github-releases depName=yonahd/kor
pkgver=0.6.4
pkgrel=2
pkgdesc='Kubernetes Orphaned Resources Finder'
arch=('x86_64')
url=https://github.com/yonahd/kor
license=('MIT')
depends=('glibc' 'kubectl')
makedepends=('go' 'git')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
groups=('kubectl-plugins')
provides=("kubectl-${pkgname}")
sha256sums=('3b3dbe74e2cb1a5b059ea087996b66f1fae3b8082734deffb0debee0b6c61be7')
b2sums=('cbeb67ae70d572ff1ca241d4bfaaa193c69c5bd5c82e3de3652495c31b6f543a45765f5489944a2a3039918d37464d7a03502bc846e49a4cb990b60bc47eaffd')

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
  if [[ " ${OPTIONS[*]} " =~ " ${value} " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"
  mkdir bin
  go mod tidy
  go build -v \
    -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
    -o bin/ \
    ./...
}

check() {
  cd ${pkgname}-${pkgver}
  go test -short ./...
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname $i
  done
}

# vim:set ts=2 sw=2 et:
