# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs
_pkgbase=bitwarden_rs
pkgver=1.2.0
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
	"0001-Disable-Vault.patch")
sha512sums=('4f64ccf7f14c9f757113f71871d8ff19cc105818bc66072c9b604bc0817dabccdb1e7beaed0f0349488af740aaf610c5de1163b00982ea16fda633db1f1a5d0e'
            '399e63002acb764895bbcf3b983642c8858343b36909eeeb73133de1a9740a3d81232bc206ff6bf3daed50f72354c5e6fd5314d0d044acd9f1cb23a933b1dd74'
            '773dc0830b4eaf3a1d4134a52a6157e6a94265c6212ae8cc24b9584f9c444b9a0f822325f487ce9c23c363f743f1f64f269352f030e98e336816aee0a68048f6'
            'a9ed56a349ba6243fbb5aa775681feecbf5dff62acb301e0f214455eb0e55b9c9d01ef8c19432b6b204bc0bc9be43adb2f33d0c48712419d4030182b13931754')
_src="$pkgname-$pkgver"

build() {
	#build bitwarden_rs
	cd "$srcdir/$_src"
	patch -N -p1 -i "$srcdir/0001-Disable-Vault.patch"
	cargo build --release
}

package() {
	# setup systemd service
	install -D -m 0644 "$srcdir/bitwarden_rs.service" "$pkgdir/usr/lib/systemd/system/bitwarden_rs.service"
	# copy default config file
	install -D -m 0644 "$srcdir/$_src/.env" "$pkgdir/etc/bitwarden_rs.env"
	# copy binary
	install -D -m0755 "$srcdir/$_src/target/release/bitwarden_rs" "$pkgdir/usr/bin/bitwarden_rs"
}
