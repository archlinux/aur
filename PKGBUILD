# Maintainer: fuero <fuerob@gmail.com>
pkgname="ingress2gateway"
# renovate: datasource=github-releases depName=kubernetes-sigs/ingress2gateway
pkgver=1.1.0
pkgrel=1
pkgdesc="translate Ingress and provider-specific resources (CRDs) to Gateway API resources."
arch=('x86_64')
url="https://github.com/kubernetes-sigs/ingress2gateway"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a3c74ca555df43e40b0acd89743cb0ade9b1ad72bcd61fad0d0bec0b233a9c7c')
b2sums=('f2cb2412208420a6b7b065aa81c0c3bf8fcbc4d90247cd2d71e269860e939bcc01a3b829eef3562750c67d954a9329862a43618f6fdd0b893c857bc2c7a3d598')

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
  # exclude e2e tests
  go test -short ./pkg/...
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
