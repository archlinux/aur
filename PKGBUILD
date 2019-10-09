# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-mysql
_pkgbase=bitwarden_rs
pkgver=1.11.0
pkgrel=1
pkgdesc="An unofficial lightweight implementation of the bitwarden-server using rust and mysql. Does NOT include the web-interface."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dani-garcia/bitwarden_rs"
license=('GPL3')
depends=('openssl')
makedepends=('rust-nightly' 'cargo-nightly' 'mysql')
optdepends=("bitwarden_rs-vault: Web Interface 'Vault'")
conflicts=("${_pkgbase}-git" "${_pkgbase}" "${_pkgbase}-postgresql")
provides=("${_pkgbase}")
backup=('etc/bitwarden_rs.env')
install=bitwarden_rs.install
source=("https://github.com/dani-garcia/bitwarden_rs/archive/$pkgver.tar.gz"
	"${_pkgbase}.install"
	"${_pkgbase}.service"
	"0001-Disable-Vault.patch")
sha512sums=('d45e3a88e5569689e9c94645f97716c05945c23aa76f1dd16e06d929d293ed90622414492f196d8ee6220477f499d3be9048ebf6ccaaca5e86370f65df0c6c2c'
            '399e63002acb764895bbcf3b983642c8858343b36909eeeb73133de1a9740a3d81232bc206ff6bf3daed50f72354c5e6fd5314d0d044acd9f1cb23a933b1dd74'
            '4ce188956f6fe7cfdb711b1505f6344ed2775751ea112a0506dc96455c2705ab8529ec442e4747d7810fc3535b4ca78d1864e874dab5b5306373587097e02658'
            'a6f2361c7aa83e63b9a557500406b0cd660e0d7f8b16345f859faa3f96e22bdcecd7589711960486fa0401896291f7d46f66882744c69117fc146056f4a49028')
_src="$_pkgbase-$pkgver"

build() {
	#build bitwarden_rs
	cd "$srcdir/$_src"
	patch -N -p1 -i "$srcdir/0001-Disable-Vault.patch"

	cargo build --release --no-default-features --features mysql
}

package() {
	# setup systemd service
	install -D -m 0644 "$srcdir/bitwarden_rs.service" "$pkgdir/usr/lib/systemd/system/bitwarden_rs.service"
	# copy default config file
	install -D -m 0644 "$srcdir/$_src/.env.template" "$pkgdir/etc/bitwarden_rs.env"
	# copy binary
	install -D -m0755 "$srcdir/$_src/target/release/bitwarden_rs" "$pkgdir/usr/bin/bitwarden_rs"
}
