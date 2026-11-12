# Maintainer: agony <27015 at riseup dot net>

pkgname=zero
pkgver=0.13.0
pkgrel=1
pkgdesc='Fast, multi-provider terminal coding agent'
arch=('x86_64' 'aarch64')
url='https://github.com/Twigpine/zero'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('agent-browser: browser control'
            'bubblewrap: sandbox for shell commands'
            'git: repository info, plugin and skill installs'
            'poppler: PDF text and rendering of image-only PDFs'
            'tuistory: terminal control')
source=("zero-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b826c0189e117c6ae4b8adfd1199fa41bf2e3a14c1d030ead18d82e22c20b65')

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
}

prepare() {
  cd "zero-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "zero-${pkgver}"
  _go_env
  go build -v -ldflags="-linkmode=external -X github.com/Twigpine/zero/internal/cli.version=${pkgver}" \
    -o build/ ./cmd/zero ./cmd/zero-linux-sandbox
  for shell in bash fish zsh; do
    build/zero completions "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "zero-${pkgver}"
  _go_env
  local _zero="${PWD}/build/zero"
  [[ "$("${_zero}" version)" == "zero ${pkgver}" ]]
  cd internal/perfbench/testdata/nav
  GIT_CEILING_DIRECTORIES="${srcdir}" "${_zero}" repo-map | grep -q '^  main\.go'
}

package() {
  cd "zero-${pkgver}"
  install -Dm755 build/zero build/zero-linux-sandbox -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/zero"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zero.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_zero"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
