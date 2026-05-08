# Maintainer: Pablo <pablo@example.com>
pkgname=tango-cli
pkgver=1.0.10
pkgrel=1
pkgdesc="Declarative API testing CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/pc0stas/tango"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('639f27b195125e58ae13e5bec45da9c41eb50e0d0094e8d135bcf6bc91e4818f')

build() {
  cd "tango-${pkgver}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.Version=v${pkgver}" -o tango .

  ./tango completion bash > tango.bash
  ./tango completion zsh  > _tango
  ./tango completion fish > tango.fish
}

package() {
  cd "tango-${pkgver}"
  install -Dm755 tango "${pkgdir}/usr/bin/tango"
  install -Dm644 tango.bash "${pkgdir}/usr/share/bash-completion/completions/tango"
  install -Dm644 _tango "${pkgdir}/usr/share/zsh/site-functions/_tango"
  install -Dm644 tango.fish "${pkgdir}/usr/share/fish/vendor_completions.d/tango.fish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
