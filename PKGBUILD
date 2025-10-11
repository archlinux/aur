# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-rakkess
_pkgname=rakkess
# renovate: datasource=github-releases depName=corneliusweig/rakkess
pkgver=0.5.1
pkgrel=5
pkgdesc='kubectl plugin to show an access matrix for server resources'
arch=('x86_64' 'aarch64')
url='https://github.com/corneliusweig/rakkess'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
optdepends=(
  'bash-completion: auto-completion for flux in Bash',
  'zsh-completions: auto-completion for flux in ZSH'
)
provides=('kubectl-access-matrix')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7a774dea7d3bc2994cc9523f269838aa2eeb4d0553b3d2817d364dc78d9a7774f43870914fbe98c18f81888172642622a1d777f09d1034f5fd4b182ef898d42f')
b2sums=('c3fa0cc9458610b488a66539b10f15a2bba07e0eaa65690e829a8ebdbce2eb3e0e8e08b5d4d384a4217f7613ce53857b773fbcdc06b41613ca2b2348c543f17d')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
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

  cd "${_pkgname}-${pkgver}"
  go build -v \
    -ldflags="${_x[*]/#/-X=${url/https:\/\/}/pkg/version.} -linkmode=external" \
    -o bin/ \
    ./...
}

check() {
  cd "${_pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  ln -snf "${pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -snf "${pkgname}" "${pkgdir}/usr/bin/kubectl-access_matrix"

  "bin/${_pkgname}" completion bash \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "bin/${_pkgname}" completion zsh \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  "bin/${_pkgname}" completion fish \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
