# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-terminal
pkgver=0.3.0
pkgrel=1
pkgdesc="Live terminal-art wallpapers for Niri"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-terminal"
license=('MIT' 'CC0-1.0' 'CC-BY-4.0' 'CC-BY-NC-4.0' 'CC-BY-SA-4.0' 'CC-BY-NC-SA-4.0')
depends=('niri' 'ttf-jetbrains-mono')
optdepends=('sysc-shell: select effects from the desktop')
makedepends=('go>=1.26.4')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-terminal/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1de705ccc45ca9bf7efe434fd4b7ae14fb1b4a35b0e195ce1421dfcc5e55e960')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOTOOLCHAIN=local
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_ENABLED=0
  go build -buildvcs=false -o "${pkgname}" "./cmd/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  local model_dir
  model_dir=$(GOWORK=off go list -m -f '{{.Dir}}' github.com/Nomadcxx/sysc-Go)
  install -Dm644 "${model_dir}/animations/models/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/AK47-ATTRIBUTION.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
