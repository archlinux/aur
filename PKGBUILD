# Maintainer: agony <27015 at riseup dot net>

pkgname=chainloop-cli
pkgver=1.135.1
pkgrel=1
pkgdesc='CLI for signed, policy-checked records of AI coding agents and CI/CD pipelines'
arch=('x86_64' 'aarch64')
url='https://github.com/chainloop-dev/chainloop'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
install=chainloop-cli.install
source=("chainloop-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d55bfb23442a746f3758e5ab1479fa53b8e01a830bebee861fd805f00fab0857')

_go_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export XDG_CACHE_HOME="${HOME}/.cache"
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  export DO_NOT_TRACK=1
}

prepare() {
  cd "chainloop-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "chainloop-${pkgver}"
  _go_env
  go build -v -ldflags="-linkmode=external -X github.com/chainloop-dev/chainloop/app/cli/cmd.Version=${pkgver}" \
    -o build/chainloop ./app/cli
  for shell in bash fish zsh; do
    build/chainloop completion "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "chainloop-${pkgver}"
  _go_env
  local _policy='docs/examples/policies/json-field-validator'
  [[ "$(build/chainloop version --control-plane 127.0.0.1:1 | head -n1)" == "Client Version: ${pkgver}" ]]
  [[ "$(build/chainloop policy develop eval --policy "${_policy}/policy.yaml" --material "${_policy}/testdata/config.json" \
    --kind EVIDENCE --input required_field=application.name --input expected_value=web-service | tr -d ' \n')" \
    == '{"result":{"violations":[],"skip_reasons":[],"skipped":false}}' ]]
}

package() {
  cd "chainloop-${pkgver}"
  install -Dm755 build/chainloop -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/chainloop"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/chainloop.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_chainloop"
}
