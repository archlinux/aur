# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
# Contributor: nirnakinho <aur at dominikbodi dot de>

pkgname=dnscontrol
pkgver=4.28.1
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://stackexchange.github.io/${pkgname}/"
license=('MIT')
depends=('glibc')
makedepends=('git'  'go')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/StackExchange/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('4e38947b3e98d62f0d6d9f2dd24bc10ba2469cb27f233f30f6ff8753a64e0bbc073c11f7d1ca1c782e26a83824ebe2803d218b9e63424c3917575601812e2844')

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
