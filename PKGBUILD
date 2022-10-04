# Maintainer: Yasuaki Uechi <y@uechi.io> (https://uechi.io)

pkgname=cfddns
pkgver=1.6.2
pkgrel=2
pkgdesc='Yet another DDNS client for Cloudflare'
arch=('any')
url='https://github.com/uetchy/cfddns'
license=('MIT')
depends=()
makedepends=('git' 'cargo' 'sed' 'openssl' 'pkgconf')
install="${pkgname}.install"
backup=('etc/cfddns/cfddns.yml')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}.install"
)
sha256sums=(
  'e6434f9a16f5f45ee294a7093c23ebe82912519f54f43ec1f88539f894c51221'
  'b6ba6f675093dbe515868d43d4e2dcec2a0ee3c419a7f58fa20f2700fad93844'
  '93a7e734d216554cea431e33ede4f658384fabbaed9ac5ba31c159fc0aecad50'
)

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
  # export RUSTFLAGS="-C opt-level=2 -C target-cpu=native"
  cargo build --release --frozen --all-features
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # cargo test --frozen --all-features
  [[ $(target/release/$pkgname --version) = "cfddns $pkgver" ]]
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

	install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m600 "etc/cfddns.yml" "$pkgdir/etc/cfddns/cfddns.yml"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
