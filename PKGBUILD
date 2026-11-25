# Maintainer: fuero <fuerob@gmail.com>
pkgname=chronytop
# renovate: datasource=github-releases depName=geerlingguy/chronytop
pkgver=0.6.1
pkgrel=1
pkgdesc='TUI for chrony NTP time server monitoring'
arch=('x86_64' 'aarch64')
url='https://github.com/geerlingguy/chronytop'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=("${pkgname}-bin")
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4ce924947246b320df636ff7767c1c32d876364b4d9b126c69d78b531ebed5b1b525ec63318067ed62020d8711666d38bec2cc53010f6338753074012d9eb24f')
b2sums=('dc34f67d6f516bdbed7d47a9d7c4124f9aa6a29f20946c5eb88d71919c36ea9eb4d1d1aea074790477325bdf51bef2ca207a9e221ae1528d1f3fa1607f2e1147')

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
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -buildvcs=false"
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
    -o bin/
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
 
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
