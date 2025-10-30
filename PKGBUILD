# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-find
# renovate: datasource=github-releases depName=alikhil/kubectl-find
pkgver=0.8.0
pkgrel=1
pkgdesc='plugin for kubectl that gives you a UNIX find-like experience'
arch=('x86_64' 'aarch64')
url='https://github.com/alikhil/kubectl-find'
license=('Apache-2.0')
depends=('kubectl' 'glibc' 'bash')
makedepends=('go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('24fe0a932e10b883b02c84a2c60c5950fdb0eb38724d6a9de029e6c85ff7563a882477b61060a9ebfab7cde0660f915b3ed904cd769c8ecdd2a7469936c635d7')
b2sums=('121e9468888d3b786d0b2434e19e102e1529ded787b0640074baad148da1470e8d763204657efdc74465777b053fd03e51b4b14b3c2855741614e3a803b0f1c3')

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
  install -Dm755 "bin/cmd" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "kubectl_complete-fd" "${pkgdir}/usr/bin/kubectl_complete-find"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
