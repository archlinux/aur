# Maintainer: fuero <fuerob@gmail.com>
pkgname=cyphernetes
# renovate: datasource=github-releases depName=avitaltamir/cyphernetes
pkgver=0.18.2
pkgrel=2
pkgdesc='A Kubernetes Query Language'
arch=('x86_64' 'aarch64')
url='https://github.com/AvitalTamir/cyphernetes'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6fb948ac74f9fb9dd87ff730fdee8305b0d967e5eaee94853f407148070f15fb4fa91692841d02c61d02180accbf8cbd30a88dd20cc5a70aa102519836e9d284')
b2sums=('e0e58992b2392db4f79476168a81fc047d9c8bbf3f9ae69924cd9693f65f7f07d91fd859a1da14a9c0c2a4d28232dbfeccbd59d6fab71889b21f00b462aaf590')

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
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"
  for i in cyphernetes kubectl-cypher
  do
    (
      cd "./cmd/${i}"
      go build -v \
        -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
        -o ../../bin/
    )
  done
}
# e2e tests fail
#check() {
#  cd "${pkgname}-${pkgver}"
#  go test -short ./...
#}

package() {
  cd "${pkgname}-${pkgver}"
 
  for i in "${pkgname}" kubectl-cypher
  do
    install -Dm755 "bin/${i}" "${pkgdir}/usr/bin/${i}"

    "bin/${i}" completion bash \
      | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${i}"
    "bin/${i}" completion zsh \
      | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${i}"
    "bin/${i}" completion fish \
      | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${i}.fish"
  done
  
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
