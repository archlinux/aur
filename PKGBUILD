# Maintainer: Markus Pesch <markus.pesch plus apps at cryptic.systems>

pkgname=opa-regal
_pkgname=regal
pkgver=0.42.0 # renovate: datasource=github-tags depName=open-policy-agent/regal extractVersion='^v?(?<version>.*)$'
pkgrel=1
pkgdesc="Regal is a linter and language server for Rego"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/open-policy-agent/${_pkgname}"
license=('Apache 2.0')
makedepends=('go')
source=(
  "$url/archive/refs/tags/v${pkgver}.zip"
)
sha512sums=('f1ceddf88ac08a2949e2fd847015ff1b9d00296ac7186ebbadd00a36c86dfd766a8e497ef9a8ad328139474d8451bcbf0effc4756c9864c297b611bc5d876a53')
b2sums=('1467acc61a66de1b1d70255441bbfa41a78b2ec6bbf6bc3c4947c854acfbe2ed1de27dc67c018aebfc7bdb7e3942007d69943d7e721e2c2930fa437c523529b8')

prepare() {
  cd ${_pkgname}-${pkgver}

  export GONOSUMDB="${GONOSUMDB}"
  export GOPATH="${srcdir}"
  export GOPROXY="${GOPROXY}"

  env | sort | grep -E '^C?GO'

  go mod download -modcacherw
}

build() {
  cd "${_pkgname}-${pkgver}"

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  export GONOSUMDB="${GONOSUMDB}"
  export GOPATH="${srcdir}"
  export GOPROXY="${GOPROXY}"

  env | sort | grep -E '^C?GO'

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "\
      -s -w
      -X github.com/open-policy-agent/regal/pkg/version.Version=${pkgver}
      -X github.com/open-policy-agent/regal/pkg/version.Commit=${pkgver}
      -X github.com/open-policy-agent/regal/pkg/version.Timestamp=$(date --iso-8601=seconds)
      -X github.com/open-policy-agent/regal/pkg/version.Hostname=AUR
    " \
    -trimpath \
    -o ${_pkgname} .

  ${_pkgname} completion bash > ${_pkgname}.bash
  ${_pkgname} completion fish > ${_pkgname}.fish
  ${_pkgname} completion zsh > ${_pkgname}.zsh
}

package() {
  # binary
  install -D --mode 0755 "${_pkgname}-${pkgver}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

  # completions
  install -D --mode 0644 "${_pkgname}-${pkgver}/${_pkgname}.bash" "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -D --mode 0644 "${_pkgname}-${pkgver}/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -D --mode 0644 "${_pkgname}-${pkgver}/${_pkgname}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

  # license
  install -D --mode 0755 "${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
