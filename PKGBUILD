# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-oomd
# renovate: datasource=github-releases depName=jdockerty/kubectl-oomd
pkgver=0.0.7
pkgrel=4
pkgdesc='kubectl plugin to display the pods and containers which have recently been OOMKilled'
arch=('x86_64' 'aarch64')
url='https://github.com/jdockerty/kubectl-oomd'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('008a74ac60c88e5ce1fb70213fced7eb5547e81ebc94095929f945afc6f81d3b8a64c2ea110c3e1889b006906c34f257aaa2f402f807433a2aae6864116fa15f')
b2sums=('37ef42c2c4b6aa2320bfc0dddb3ba3f6c93268b2897371dc74644c68eae2536981d25fb832d7ac162e4ce3234dce3e012c33b019973c343f19eeabe27e50bc1d')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    Version="v${pkgver}"
    Commit="${_commit:?}"
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
    -ldflags="${_x[*]/#/-X=main.} -linkmode=external" \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/plugin "${pkgdir}/usr/bin/${pkgname}"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
