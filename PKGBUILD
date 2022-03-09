# Maintainer: Yasuaki Uechi <y@uechi.io> (https://uechi.io)

pkgname=cfddns
pkgver=1.6.1
pkgrel=1
pkgdesc='Yet another DDNS client for Cloudflare'
arch=('any')
url='https://github.com/uetchy/cfddns'
license=('MIT')
depends=()
makedepends=('git' 'rust')
install="${pkgname}.install"
backup=('etc/cfddns/cfddns.yml')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}.install"
)
sha256sums=(
  'a9257ae415bbda633d99dbd99120716b028059c378d213def6faeee12a49768c'
  'b6ba6f675093dbe515868d43d4e2dcec2a0ee3c419a7f58fa20f2700fad93844'
  'fd0d38ae6df41e37512bc6a4d94e467b80adffa684890562527a824dc1c45e28'
)

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

	install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m600 "etc/cfddns.yml" "$pkgdir/etc/cfddns/cfddns.yml"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
