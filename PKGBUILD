# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-find
# renovate: datasource=github-releases depName=alikhil/kubectl-find
pkgver=0.3.0
pkgrel=2
pkgdesc='plugin for kubectl that gives you a UNIX find-like experience'
arch=('x86_64' 'aarch64')
url='https://github.com/alikhil/kubectl-find'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0174fd81311f34eb6002d1311363f0fdffdef12a10e357bb220de38518ad4438bbf6a74b9545a25e6fe4a9cc9e3edac7eaf8d50e95e4d17d7d63fe83c0e03e10')
b2sums=('8940ceeab59ca2c08558fbec8596ffc353c159d528378d706bee2002aef81d7b91faf1aa239231f05e0555699e4b577a0d3ecff56f275827092fea3f2568b6c2')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
    date="$(date +%F)"
  )

  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -v"
  export GO111MODULE=on
  mkdir bin
  go mod tidy
  go build \
    -ldflags="-s -w ${_x[*]/#/-X=main.}" \
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
  install -Dm755 "kubectl_complete-find" "${pkgdir}/usr/bin/kubectl_complete-find"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
