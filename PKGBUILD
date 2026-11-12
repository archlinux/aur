# Maintainer: agony <27015 at riseup dot net>

pkgname=deja-vu
pkgver=0.24.2
pkgrel=1
pkgdesc='Shared local memory, cross-agent handoff and code recovery for coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/vshulcz/deja-vu'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('deja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89857d24d39b949f2b92111b8a2a2735201f975136dcca272bcd6c13decc9a25')

_deja_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export XDG_CACHE_HOME="${HOME}/.cache"
  export XDG_STATE_HOME="${HOME}/.local/state"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  _deja_env
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X main.version=${pkgver}" -o deja ./cmd/deja
  for shell in bash fish zsh; do
    ./deja completion "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  _deja_env
  [[ "$(./deja version)" == "deja ${pkgver}" ]]
  [[ "$(DEJA_CLAUDE_ROOT=fixtures/synthetic/claude ./deja --no-embed --role assistant frobnicator | tail -n 1)" == '  The frobnicator bug is in parser.go' ]]
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 deja -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/deja"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/deja.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_deja"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
