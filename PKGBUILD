# Maintainer: fuero <fuerob@gmail.com>
pkgname=gonzo
# renovate: datasource=github-releases depName=control-theory/gonzo
pkgver=0.1.7
pkgrel=1
pkgdesc='TUI log analysis tool'
arch=('x86_64' 'aarch64')
url=https://github.com/control-theory/gonzo
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e066c5815521317ba28c86e6b66bf9505ee3ddcdc22710b8d0bc387e8bb7e21a14939aebb34600f468496881f28445142a020ad3d4143dd3d90a84e0656eb8a2')
b2sums=('1dadf5830f208afe69f4c181943b09a5a91250ed0d06db1f53890778773889b800683a99c916c2e21d1141888db232a9af7d963265ecfdf533cde3e25e298782')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
    buildTime="$(date -u +%Y%m%d.%H%M%S)"
  )

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " ${value} " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"
  mkdir bin
  go mod tidy
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

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
