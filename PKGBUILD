# Maintainer: fuero <fuerob@gmail.com>
pkgname=chronytop
# renovate: datasource=github-releases depName=geerlingguy/chronytop
pkgver=0.6.2
pkgrel=1
pkgdesc='TUI for chrony NTP time server monitoring'
arch=('x86_64' 'aarch64')
url='https://github.com/geerlingguy/chronytop'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=("${pkgname}-bin")
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('057e517bbbead30279dd5fc455b88f4d0246632b00581ca45ef78f2573ae0acbe09ff145aa22172e010e0126fb7c12a34fc6af5c05c4208644d1e6d1bd74732e')
b2sums=('632eb405437c67b8560fad6af53268d2e286c461eafb717a44c138b6bb67e028d48a5c17abb3049c0f7df904e05fa700f228b4f1338abc2bc1cd074597b30f18')

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
