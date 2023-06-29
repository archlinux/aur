# Contributor: matthias.lisin
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=mockery
pkgname="golang-${_pkgname}"
pkgver=2.30.16
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('any')
url='https://github.com/vektra/mockery'
license=("BSD")
depends=('glibc')
makedepends=('go')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b92d44f37e64115c970c9d6717dd9e9c91830c1689dd0a945ada245854c415ed')

build() {
  cd "${_pkgname}"-"${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  # For Chinese Only
  #export GO111MODULE=on
  #export GOPROXY=https://goproxy.cn
  go build -o "${_pkgname}" -ldflags "-linkmode=external -X github.com/vektra/mockery/v2/pkg/config.SemVer=v${pkgver}" main.go

  for _shell in bash zsh fish; do
    # --config=/dev/null to avoid reading .mockery.yaml
    ./mockery --config=/dev/null completion "${_shell}" >completion."${_shell}"
  done
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "completion.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}