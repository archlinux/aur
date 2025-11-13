# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-explore
# renovate: datasource=github-releases depName=keisku/kubectl-explore
pkgver=0.14.1
pkgrel=3
pkgdesc='kubectl plugin expanding explain functionality with fuzzy search'
arch=('x86_64' 'aarch64')
url='https://github.com/keisku/kubectl-explore'
license=('Apache-2.0')
depends=('kubectl' 'glibc' 'bash')
makedepends=('go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6a46c3d0effe7d6641acbb088faf1fc7f91581359ad48ce01c0348656233e67c9895d921602ae07079ce7ac5ff94d1ef677423c8e1812f31e8efc5bb9836387d')
b2sums=('81f584a3df9ef52ff552ae05c7e95b9c80b1b3bfdeaae6904d321656a5becce32f3dde556c548daf58c9f427b6960e98ee669996f113d8d50d7fb6f38283b604')

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
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
