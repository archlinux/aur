# Maintainer: Pablo <pablo@example.com>
pkgname=tango-cli
pkgver=1.0.9
pkgrel=1
pkgdesc="Declarative API testing CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/pc0stas/tango"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f64b91db5f295e908b36f2aeb6434c55594e7efa147d8d9007bf97780ec2de96')

build() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.Version=v${pkgver}" -o tango .

  ./tango completion bash > tango.bash
  ./tango completion zsh  > _tango
  ./tango completion fish > tango.fish
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 tango "${pkgdir}/usr/bin/tango"
  install -Dm644 tango.bash "${pkgdir}/usr/share/bash-completion/completions/tango"
  install -Dm644 _tango "${pkgdir}/usr/share/zsh/site-functions/_tango"
  install -Dm644 tango.fish "${pkgdir}/usr/share/fish/vendor_completions.d/tango.fish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
