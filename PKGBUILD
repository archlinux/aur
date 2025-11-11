# Maintainer: fuero <fuerob@gmail.com>
pkgname="ingress2gateway"
# renovate: datasource=github-releases depName=kubernetes-sigs/ingress2gateway
pkgver=0.4.0
pkgrel=1
pkgdesc="translate Ingress and provider-specific resources (CRDs) to Gateway API resources."
arch=('x86_64')
url="https://github.com/kubernetes-sigs/ingress2gateway"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7c511e4c309b62d01ce2128643922637f0ca77524bab2c4c6811bebbb43ff119')
b2sums=('2a58b3d5420df79a934da803dfc7e558e839dc2eefddaa3ef1912be8df751b7967b5c42745fab2a9f97bc5afb7e8e98257b9fa94cda399c71da5954e2af6a3fc')

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
