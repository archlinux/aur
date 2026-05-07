# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=zeshion
pkgver=0.1.0alpha1
_tag=v0.1.0-alpha.1
pkgrel=1
pkgdesc="Session manager for tmux and Zellij"
arch=('x86_64' 'aarch64')
url="https://github.com/OneNoted/zeshion"
license=('MIT')
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go'
)
optdepends=(
  'tmux: tmux session management'
  'zellij: Zellij session management'
  'zoxide: zoxide-backed directory sessions'
)
provides=('zeshion')
conflicts=('zeshion-git')

_source_dir="${pkgname}-${_tag}"
source=(
  "${_source_dir}::git+https://github.com/OneNoted/zeshion.git#tag=${_tag}"
)
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_source_dir}"

  mkdir -p "${srcdir}/gopath" "${srcdir}/gocache"
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  go mod download
}

build() {
  cd "${srcdir}/${_source_dir}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' -X main.version=${_tag}" \
    -o zeshion \
    .

  ./zeshion completion bash >zeshion.bash
  ./zeshion completion fish >zeshion.fish
  ./zeshion completion zsh >_zeshion
  ./zeshion man >zeshion.1
}

package() {
  cd "${srcdir}/${_source_dir}"

  install -Dm755 zeshion "${pkgdir}/usr/bin/zeshion"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 docs/release-smoke-test.md \
    "${pkgdir}/usr/share/doc/${pkgname}/release-smoke-test.md"
  install -Dm644 zeshion.schema.json \
    "${pkgdir}/usr/share/zeshion/zeshion.schema.json"
  install -Dm644 zeshion.1 "${pkgdir}/usr/share/man/man1/zeshion.1"
  install -Dm644 zeshion.bash \
    "${pkgdir}/usr/share/bash-completion/completions/zeshion"
  install -Dm644 zeshion.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/zeshion.fish"
  install -Dm644 _zeshion \
    "${pkgdir}/usr/share/zsh/site-functions/_zeshion"
}
