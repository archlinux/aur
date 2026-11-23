# Maintainer: fuero <fuerob@gmail.com>
pkgname=chronytop
# renovate: datasource=github-releases depName=geerlingguy/chronytop
pkgver=0.6.0
pkgrel=1
pkgdesc='TUI for chrony NTP time server monitoring'
arch=('x86_64' 'aarch64')
url='https://github.com/geerlingguy/chronytop'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=("${pkgname}-bin")
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a87217182502e0017b13c2a721aa2c45de137ee6091c0dc9a29afccbdd3bab8f00206ce00e85d3f9a2910cad22376f671914a05fa741397c283727d570b1c739')
b2sums=('0fad12b2555030b7ed47131f2fcf4b7d9cef2e191eb493a4192fb65e657ff3c7c5e1a54fffad38080ec20e59a88968dfb8ca2114fe90cc205c01886be1c2f961')

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
