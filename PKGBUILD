# Maintainer: Fuero <fuerob@gmail.com>

pkgname=styx-go-git
_pkgname=styx
# renovate: datasource=github-releases depName=mikefarah/yq
pkgver=r30.da5d264
pkgrel=1
pkgdesc='Export Prometheus data as CSV or directly plot with gnuplot & matplotlib'
arch=('x86_64')
url=https://github.com/go-pluto/"${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=(
  "${_pkgname}::git+${url}"
  'delimiter.patch'
)
b2sums=('SKIP'
        'ff87867fda40ec3daa2c9d55aa3a6ae4832263f7698d319cd77178b4fe136591fba4146839caa1ab0658c211f84c9cd10a750ecdd34c4de1d3437d8a7170ea19')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  patch -Np1 -i "../delimiter.patch"
}

build() {
  local _x _commit

  cd "${_pkgname}"
  _commit=$(git rev-parse --short=7 HEAD)
  _x=(
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

  go build -v \
    -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
    -o bin/ \
    ./...
}

check() {
  cd "${_pkgname}"
  LC_ALL=C LANG=C go test ./...
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "$pkgdir"/usr/bin "bin/${_pkgname}"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md

# ./go-yq shell-completion bash | install -Dm644 /dev/stdin \
#   "$pkgdir"/usr/share/bash-completion/completions/yq
# ./go-yq shell-completion zsh | install -Dm644 /dev/stdin \
#   "$pkgdir"/usr/share/zsh/site-functions/_yq
# ./go-yq shell-completion fish | install -Dm644 /dev/stdin \
#   "$pkgdir"/usr/share/fish/vendor_completions.d/yq.fish
}

# vim:set ts=2 sw=2 et:
