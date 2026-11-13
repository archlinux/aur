# Maintainer: Carlos Galindo <arch /at- cgj.es>

pkgname=vigil-local
pkgver=1.4.0
pkgrel=1
pkgdesc="Monitors hosts behind a firewall and reports their status to Vigil."
arch=("x86_64" "armv7h")
url="https://github.com/valeriansaliou/vigil-local"
license=("MPL-2.0")
makedepends=("cargo")
options=(!lto)
backup=('etc/vigil-local.cfg')
source=('vigil-local.service'
        'vigil-local.sysusers'
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('f43d7a780a3d65d2d0f24841f4d9a2601d54e539b6f60ee64697c45317b1cc6903e9025becbd11551046bf16478b9185533cc056c62b8c0ceb6d3b0a31c519c4'
            '537ab1d322dade4d321da59e18653c08384b46c41ef63acde3a60bf58e31e6a50e9eab73b885daf319b8500a22cbcd6d20e19f3c714f7cce050e0a6d20d6d8e7'
            '3bfd1dfa85704d358e1a7bd0f391480be4cb40274534329e1ea2f5ea5c33583098f492b049dc34f4ec704c8e9ae4849b587426a95600db26cb40444bfbdc1653')

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

