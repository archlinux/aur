# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
# Contributor: nirnakinho <aur at dominikbodi dot de>

pkgname=dnscontrol
pkgver=4.35.0
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://stackexchange.github.io/${pkgname}/"
license=('MIT')
depends=('glibc')
makedepends=('git'  'go')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/StackExchange/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('762d16a5cbb102a849a08292bde2a4052095f7f697707d9ed8a3f24d0bdfd0a7115c1597ef6b8e4433df83a91d2e08da947cdde635d4fcf81c49128c5309c39a')

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
