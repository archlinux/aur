# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
# Contributor: nirnakinho <aur at dominikbodi dot de>

pkgname=dnscontrol
pkgver=4.29.0
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://stackexchange.github.io/${pkgname}/"
license=('MIT')
depends=('glibc')
makedepends=('git'  'go')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/StackExchange/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('70a3a987039e4e9b786f69e0c5c8c595533e2bfb69fd64b2ad87dadc8f30e7a3ace56dd2b69cd41b8980a38f77ebbaf62fcff4fbe3029fddb8e5c3373ffe735b')

prepare(){
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="${pkgver}"
    commit="${_commit:?}"
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

  set | grep GO_
  
  cd "${pkgname}-${pkgver}"
  go build -v \
    -ldflags="${_x[*]/#/-X=github.com/StackExchange/dnscontrol/v4/pkg/version.} -linkmode=external" \
    -o build/ \
    .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  "build/${pkgname}" shell-completion bash \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "build/${pkgname}" shell-completion zsh \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
