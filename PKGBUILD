# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs
_pkgbase=bitwarden_rs
pkgver=1.13.0
pkgrel=1
pkgdesc="An unofficial lightweight implementation of the bitwarden-server using rust and sqlite. Does NOT include the web-interface."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dani-garcia/bitwarden_rs"
license=('GPL3')
depends=('openssl')
makedepends=('rust-nightly' 'cargo-nightly')
optdepends=("bitwarden_rs-vault: Web Interface 'Vault'")
conflicts=("${_pkgbase}-git" "${_pkgbase}-mysql" "${_pkgbase}-postgresql")
backup=('etc/bitwarden_rs.env')
install=bitwarden_rs.install
source=("https://github.com/dani-garcia/bitwarden_rs/archive/$pkgver.tar.gz"
	"${_pkgbase}.install"
	"${_pkgbase}.service"
	"0001-Disable-Vault.patch"
	"0002-Fix-tests.patch")
sha512sums=('ef17482b98b8caa089c957bc3db53f3adcbcdd1b8b64cb4b94612875bf939e259b9ef5928d2aaf99490534a83b48a3ec06933c28b243be1c41bf3dfbe68f5c8d'
            '399e63002acb764895bbcf3b983642c8858343b36909eeeb73133de1a9740a3d81232bc206ff6bf3daed50f72354c5e6fd5314d0d044acd9f1cb23a933b1dd74'
            '4ce188956f6fe7cfdb711b1505f6344ed2775751ea112a0506dc96455c2705ab8529ec442e4747d7810fc3535b4ca78d1864e874dab5b5306373587097e02658'
            'a6f2361c7aa83e63b9a557500406b0cd660e0d7f8b16345f859faa3f96e22bdcecd7589711960486fa0401896291f7d46f66882744c69117fc146056f4a49028'
            '5d0e5a96dbd23d2e2fb1a89e2db8817018feb6a05dc854c5a9a3d1b84f94605c6a1f597dc233ec5ca6ff7adb18bbfdca2bcb2645de31c17f38470f649468ef44')
_src="$pkgname-$pkgver"



build() {
	#build bitwarden_rs
	cd "$srcdir/$_src"
	patch -N -p1 -i "$srcdir/0001-Disable-Vault.patch"
	patch -N -p1 -i "$srcdir/0002-Fix-tests.patch"
	cargo build --release --locked --features sqlite
}

check() {
	cd "$srcdir/$_src"
	cargo test --release --locked --features sqlite
}

package() {
	# setup systemd service
	install -D -m 0644 "$srcdir/bitwarden_rs.service" "$pkgdir/usr/lib/systemd/system/bitwarden_rs.service"
	# copy default config file
	install -D -m 0644 "$srcdir/$_src/.env.template" "$pkgdir/etc/bitwarden_rs.env"
	# copy binary
	install -D -m0755 "$srcdir/$_src/target/release/bitwarden_rs" "$pkgdir/usr/bin/bitwarden_rs"
}
