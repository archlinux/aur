# Maintainer: Carlos Galindo <arch /at- cgj.es>

pkgname=vigil-local
pkgver=1.0.0
pkgrel=1
pkgdesc="Vigil Local daemon. Used as a slave service to monitor hosts behind a firewall and report their status to Vigil."
arch=("x86_64" "armv7h")
url="https://github.com/valeriansaliou/vigil-local"
license=("MPL2")
makedepends=("cargo")
backup=('etc/vigil-local.cfg')
source=('vigil-local.service'
        'vigil-local.sysusers'
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c17ec2803fe91110cf12239a125af35a8e722f363d21679fb33a03244f15a5d497ad3c681c691d63da2ce96b040317b6e254a1e0db287cb6973323cfda0a1665'
            '98634e670f732777184212a50b9a1d41e2669b04cb02b3d62c882eba1c306e5d2ed71ec0ba860541a72702b36b964c3875af5db8f6e87e825ddf8708439606a2'
            '1fa51ebfd520bf1b3cc02fd1bb39acb7fe8b54454b480f2d8519d5ebbeb79e947cf130ef9d0d216fe89934629ac21c635242c90996ef539773a41c2adeaf131d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --all-features --target-dir=target
}

package() {
  install -Dm644 vigil-local.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 vigil-local.sysusers "${pkgdir}/usr/lib/sysusers.d/vigil-local.conf"
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 config.cfg "${pkgdir}/etc/vigil-local.cfg"
}

