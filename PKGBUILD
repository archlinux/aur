# Maintainer: Fuero <fuerob@gmail.com>

pkgname=kor
# renovate: datasource=github-releases depName=yonahd/kor
pkgver=0.6.7
pkgrel=3
pkgdesc='Kubernetes Orphaned Resources Finder'
arch=('x86_64')
url=https://github.com/yonahd/kor
license=('MIT')
depends=('glibc' 'kubectl')
makedepends=('go' 'git')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
groups=('kubectl-plugins')
provides=("kubectl-${pkgname}")
sha256sums=('f94eb2df3e3edc3d8c4b73d193507375bf9145ef08086e60a9e5cd8f0a864726')
b2sums=('ead9d5a279f233bcfb6e623be7bc37d88e819d5ee9a4868efb686bca229f8c13e44dbefd0f58c17914e80158d0fe187243e082560b864c2e68793882d52cc286')

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
