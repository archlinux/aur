# Maintainer: Carlos Galindo <arch /at- cgj.es>
# Contributor: Hao Long <aur@esd.cc> from vigil-bin

pkgname=vigil
pkgver=1.22.1
pkgrel=2
pkgdesc="Microservices Status Page. Monitors a distributed infrastructure and sends alerts (Slack, SMS, etc.)."
arch=("x86_64" "armv7h")
url="https://github.com/valeriansaliou/vigil"
license=("MPL2")
depends=("libstrophe")
makedepends=("cargo")
backup=('etc/vigil.cfg')
source=('vigil.service'
        'vigil.sysusers'
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a437e0a11d0b4fed3d1d2fe78180811e9dec1145bf0fb7920c666c167c5d956fbf4b72ee874184c531c9eca2250c127a2c3082b0d9d0eb6d0d866e8bfb745a8a'
            '98634e670f732777184212a50b9a1d41e2669b04cb02b3d62c882eba1c306e5d2ed71ec0ba860541a72702b36b964c3875af5db8f6e87e825ddf8708439606a2'
            'd6c88fd5d70cbb0505afdf255847b7ef28c19c9343d13654083f128551e91f1f98d4ff6d53c1f7c75fa6f14748127eb11d37db58258aff1ba5a19aa793f8d172')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|path = "./res/assets/"|path = "/usr/share/vigil/"|g' config.cfg
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm644 vigil.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 vigil.sysusers "${pkgdir}/usr/lib/sysusers.d/vigil.conf"
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 config.cfg "${pkgdir}/etc/vigil.cfg"
  mkdir -p "${pkgdir}/usr/share/"
  cp -r res/assets/ "${pkgdir}/usr/share/vigil/"
}

