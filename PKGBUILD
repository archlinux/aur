# Maintainer: fuero <fuerob@gmail.com>
pkgname="ingress2gateway"
# renovate: datasource=github-releases depName=kubernetes-sigs/ingress2gateway
pkgver=0.5.0
pkgrel=1
pkgdesc="translate Ingress and provider-specific resources (CRDs) to Gateway API resources."
arch=('x86_64')
url="https://github.com/kubernetes-sigs/ingress2gateway"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6afffb36873af934f1499d68ea73d432bb711a3025e8f3f5ab330162798ce871')
b2sums=('07bc4af899f0146fb64690fc523089a70cc071bde7b901f5a7783ed3c2c8deaed3b948f49d5661b8eedf6399122b6ee88472353ba94cc2be13be4c978e5ac21a')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
  )

  cd "${pkgname}-${pkgver}"
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

  go build -v \
    -ldflags="${_x[*]/#/-X=${url/https:\/\/}/pkg/util.} -linkmode=external" \
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
  
  "bin/${pkgname}" completion bash \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "bin/${pkgname}" completion zsh \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  "bin/${pkgname}" completion fish \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
