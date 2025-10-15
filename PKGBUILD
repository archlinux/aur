# Maintainer: Kharec <sandro@cazzaniga.fr>
pkgname=docker-language-server
pkgver=0.20.1
pkgrel=1
pkgdesc="Language server for Dockerfiles, Compose and Bake files"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/docker/docker-language-server"
license=('Apache')
depends=()
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df94194ce63f0a1217944c72b941a842101aee7b7dd16018d71818d070d146a8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  go build -v \
    -trimpath \
    -buildvcs=false \
    -ldflags="-s -w -X 'github.com/docker/docker-language-server/internal/pkg/cli/metadata.Version=v${pkgver}'" \
    -o build/docker-language-server \
    ./cmd/docker-language-server
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./build/docker-language-server --help >/dev/null
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/docker-language-server "${pkgdir}/usr/bin/docker-language-server"
  ln -s docker-language-server "${pkgdir}/usr/bin/docker-langserver"
  install -d "${pkgdir}/usr/share/bash-completion/completions" \
    "${pkgdir}/usr/share/zsh/site-functions" \
    "${pkgdir}/usr/share/fish/vendor_completions.d"
  ./build/docker-language-server completion bash >"${pkgdir}/usr/share/bash-completion/completions/docker-language-server"
  ./build/docker-language-server completion zsh >"${pkgdir}/usr/share/zsh/site-functions/_docker-language-server"
  ./build/docker-language-server completion fish >"${pkgdir}/usr/share/fish/vendor_completions.d/docker-language-server.fish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
