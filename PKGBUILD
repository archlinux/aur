# Maintainer: fuero <fuerob@gmail.com>
pkgname=chronytop
# renovate: datasource=github-releases depName=geerlingguy/chronytop
pkgver=0.2.1
pkgrel=1
pkgdesc='TUI for chrony NTP time server monitoring'
arch=('x86_64' 'aarch64')
url='https://github.com/geerlingguy/chronytop'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=("${pkgname}-bin")
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1cc8895cc56f14ac43f5bf1bd7919e021c9c72c8395ced68a3f9609dabbc5fd3a76e3e57dace1af04211d36ca63ac23848a394ede7f2be9237134b8484206ee7')
b2sums=('10281808ffb92e4e8f4a52ce892a5000086ab3b24c4393e92cf63027a2c32db6379b78d8fe1fd4fbdf0283cbd1f61e7607f7da5cd8ad7c234a330e7db81305c3')

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
