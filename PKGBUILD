# Maintainer: fuero <fuerob@gmail.com>
pkgname=mynav
# renovate: datasource=github-releases depName=GianlucaP106/mynav
pkgver=2.2.0
pkgrel=3
pkgdesc='terminal-based workspace navigator and session manager'
arch=('x86_64' 'aarch64')
url='https://github.com/GianlucaP106/mynav'
license=('MIT')
depends=('tmux>=3' 'glibc')
optdepends=('git: enables repository-specific features')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('91e909182b35e51ca587c83ddedd37230c8d5ec182a3aea11f4ce682b947b37e4102e7f02af73f9a91ce54a43b08a75f4e37d5004259c6c62154d99d81eecdb4')
b2sums=('3fdec9d106f22266c4116116542a416efcefdda41cf0c2899c017a3717b8a967fe7fd02b771f42ddff85ae7829d00519571e9c0cb48182f4e34b4f07acbb19a8')

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
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -v"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"
  mkdir bin
  go build \
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
  install -Dm755 bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
