# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs
_pkgbase=bitwarden_rs
pkgver=1.6.1
pkgrel=1
pkgdesc="An unofficial lightweight implementation of the bitwarden-server using rust and sqlite. Does NOT include the web-interface."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dani-garcia/bitwarden_rs"
license=('GPL3')
depends=('openssl')
makedepends=('rust-nightly' 'cargo-nightly')
optdepends=("bitwarden_rs-vault: Web Interface 'Vault'")
conflicts=("${_pkgbase}-git") 
backup=('etc/bitwarden_rs.env')
install=bitwarden_rs.install
source=("https://github.com/dani-garcia/bitwarden_rs/archive/$pkgver.tar.gz"
	"${_pkgbase}.install"
	"${_pkgbase}.service"
	"0001-Disable-Vault.patch"
	"0002-Update-Yubico-Dep.patch")
sha512sums=('4ff36f0104368e9544a04b1f0d11e4c1a16d726dcbaeb432f83251ed413971b27b71acddb5484bc0670d3f281c74fa0624b0f2f1ef5e44e4950508fd4a7e35b4'
            '399e63002acb764895bbcf3b983642c8858343b36909eeeb73133de1a9740a3d81232bc206ff6bf3daed50f72354c5e6fd5314d0d044acd9f1cb23a933b1dd74'
            '4ce188956f6fe7cfdb711b1505f6344ed2775751ea112a0506dc96455c2705ab8529ec442e4747d7810fc3535b4ca78d1864e874dab5b5306373587097e02658'
            'a6f2361c7aa83e63b9a557500406b0cd660e0d7f8b16345f859faa3f96e22bdcecd7589711960486fa0401896291f7d46f66882744c69117fc146056f4a49028'
            'ccb82c2d895290acc2367797ecca6c050f0ce353932efeda15e4f96ed227a7e60cf1325731072b1e661a4e6f5bc705ae95c1badb1403911db1e5b6e94bb0a4cd')
_src="$pkgname-$pkgver"

build() {
	#build bitwarden_rs
	cd "$srcdir/$_src"
	patch -N -p1 -i "$srcdir/0001-Disable-Vault.patch"
	patch -N -p1 -i "$srcdir/0002-Update-Yubico-Dep.patch"
	cargo build --release
}

package() {
	# setup systemd service
	install -D -m 0644 "$srcdir/bitwarden_rs.service" "$pkgdir/usr/lib/systemd/system/bitwarden_rs.service"
	# copy default config file
	install -D -m 0644 "$srcdir/$_src/.env.template" "$pkgdir/etc/bitwarden_rs.env"
	# copy binary
	install -D -m0755 "$srcdir/$_src/target/release/bitwarden_rs" "$pkgdir/usr/bin/bitwarden_rs"
}
