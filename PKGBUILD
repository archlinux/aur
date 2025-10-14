# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_langs=(
  cpp
  go
  java
)
pkgbase=protoc-gen-validate
pkgname=(
  ${pkgbase}
  ${_langs[@]/#/${pkgbase}-}
)
pkgver=1.2.1
pkgrel=3
pkgdesc='Protoc plugin to generate polyglot message validators'
arch=(
  aarch64
  x86_64
)
url=https://github.com/bufbuild/${pkgbase}
license=(Apache-2.0)
depends=(glibc)
makedepends=(
  git
  go
)
options=(!debug)
source=(${pkgbase}::git+${url}.git#tag=v${pkgver})
sha256sums=('968c62bd5446832b6f9b5fe640ceeb37f317729eda6e1d62dfbd832e4f679f60')


prepare() {
  cd ${pkgbase}

  export GOFLAGS='-mod=readonly'

  rm -rf out

  go clean \
    -modcache
  go mod tidy -v
  go mod vendor -v
  go mod verify
}

build() {
  cd ${pkgbase}

  local _ldflags
  _ldflags=(
    -s
    -w
    -linkmode=external
  )

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=vendor -modcacherw'

  go build \
    -v \
    -ldflags "${_ldfags[*]}" \
    -o out/${pkgbase} \
    .

  local _lang
  for _lang in "${_langs[@]}"; do
    go build \
      -v \
      -ldflags "${_ldfags[*]}" \
      -o out/${pkgbase}-${_lang} \
      ./cmd/${pkgbase}-${_lang}
  done
}

check() {
  cd ${pkgbase}

  go test ./...
}

package_protoc-gen-validate() {
  depends+=(protobuf)

  cd ${pkgbase}

  install -Dm755 -t "${pkgdir}"/usr/bin \
    out/${pkgname}

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    README.md

  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    LICENSE
}

for _lang in "${_langs[@]}"; do
  eval "
package_${pkgbase}-${_lang}() {
  pkgdesc+=' - ${_lang} target'
  depends+=('${pkgbase}=${pkgver}')

  cd '${pkgbase}'

  install -Dm755 -t \"\${pkgdir}\"/usr/bin \
    out/'${pkgbase}-${_lang}'
}"
done

# vim: ts=2 sw=2 et:
