# Maintainer: fuero <fuerob@gmail.com>
pkgname=chronytop
# renovate: datasource=github-releases depName=geerlingguy/chronytop
pkgver=0.5.1
pkgrel=1
pkgdesc='TUI for chrony NTP time server monitoring'
arch=('x86_64' 'aarch64')
url='https://github.com/geerlingguy/chronytop'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=("${pkgname}-bin")
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9f47279ac36f9a1b71935e4108017af78adfa39112f4e222dfcd1cd0f94c2aa4b7b7aa78f364547debd268bd4aa67d9d51965b86a035fb73713ba5c0a3b47880')
b2sums=('0247cfde628325ace3e2f6f1dd9d56e6c83447be66e5f5374d61dd100bef6efd292896ec1e6a1d3694972ba5fa7ccd8f462afcb4f291430a0aab698a19467686')

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
