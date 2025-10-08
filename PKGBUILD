# Maintainer: fuero <fuerob@gmail.com>
pkgname=gonzo
# renovate: datasource=github-releases depName=control-theory/gonzo
pkgver=0.2.1
pkgrel=2
pkgdesc='TUI log analysis tool'
arch=('x86_64' 'aarch64')
url=https://github.com/control-theory/gonzo
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4e32760fd0965c6d7324983bb88864f452c7ba99ceabf522ed22bfe96739db86f95345f81cf5bb9fbc85c1d148bb0aed6071cf76d08ae677cc7a4c21e7480b7c')
b2sums=('0d230375ad952f2321b36cee7acee357aebabb18495c274db58ee9a06c9909e694b85e9d0939d4f670e6578ba5db67e812df7ee2454a01c96a68d7554c015eed')

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

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
