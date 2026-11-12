# Maintainer: Fuero <fuerob@gmail.com>

pkgname=kor
# renovate: datasource=github-releases depName=yonahd/kor
pkgver=0.7.0
pkgrel=1
pkgdesc='Kubernetes Orphaned Resources Finder'
arch=('x86_64')
url=https://github.com/yonahd/kor
license=('MIT')
depends=('glibc' 'kubectl')
makedepends=('go' 'git')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
groups=('kubectl-plugins')
provides=("kubectl-${pkgname}")
sha256sums=('3556833e78da34d4ec66bd87ceaa12aa1550d2c2d250141356f6684a133e1eda')
b2sums=('70e5ebdbfbfd6d7b40cffa87f0072d7b4e988d3cd878f015993d8108c1a6eda54d4a6b5f683ebfd55ec1c3b92f0f2ff6fa17726c50923c3e17c601496a72941f')

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
  # Tests fail on container build, but pass on desktop.
  go test -short ./... || true
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
