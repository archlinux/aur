# Maintainer: Carlos Galindo <arch /at- cgj.es>
# Contributor: Hao Long <aur@esd.cc> from vigil-bin

pkgname=vigil
pkgver=1.21.2
pkgrel=1
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
            'a65c3acd29acb64322190869e8ea29a1507692b72033e51137342efa9e71c89834be4e1e04f794c0137ad00142d37e82ec0417593d1e031839edca1006da474a')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|path = "./res/assets/"|path = "/usr/share/vigil/"|g' config.cfg
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --all-features --target-dir=target
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

