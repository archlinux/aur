pkgname=mqttui
pkgver=0.15.0
pkgrel=1
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
provides=("${pkgname}")

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('3d852b13800ac02ae1a7ccf4ec61d87afbc907747a41233f262543bf34f9ecbb')

build() {
  cd $pkgname-$pkgver
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 "target/completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
  install -Dm644 "target/completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "target/completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
