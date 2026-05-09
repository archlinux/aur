# Maintainer: Pablo <pablo@example.com>
pkgname=conga
pkgver=1.5.0
pkgrel=1
pkgdesc="Config generator CLI for Nginx, Docker Compose, WireGuard, Apache, and Caddy"
arch=('x86_64' 'aarch64')
url="https://github.com/pc0stas/conga"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7279cc3bd59e0509b9333dc45cd5d0e349f5c26932e0b88e808c659ae45da9e')

build() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -mod=vendor -ldflags "-X github.com/pc0stas/conga/cmd.Version=v${pkgver}" -o conga .
  ./conga completion bash > conga.bash
  ./conga completion zsh > _conga
  ./conga completion fish > conga.fish
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 conga "${pkgdir}/usr/bin/conga"
  install -Dm644 conga.bash "${pkgdir}/usr/share/bash-completion/completions/conga"
  install -Dm644 _conga "${pkgdir}/usr/share/zsh/site-functions/_conga"
  install -Dm644 conga.fish "${pkgdir}/usr/share/fish/vendor_completions.d/conga.fish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
