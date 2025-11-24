# Maintainer: Fuero <fuerob@gmail.com>

pkgname=kor
# renovate: datasource=github-releases depName=yonahd/kor
pkgver=0.6.6
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
sha256sums=('c635a981f05ba3f1c21395348e858f6e4354455ae019b023e84fe408a29c2294')
b2sums=('1c65c3f17837f534b00e5f24d8a979426097543edefea1c40c33a526a673e414263edf2c0061d7844f4d71e6dbc3848649ccce2be9ea84475bdf39bdb648fa49')

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
