# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs
_pkgbase=bitwarden_rs
pkgver=1.1.0
pkgrel=2
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
	"0002-Fix-OpenSSL.patch")
sha512sums=('3b8290b5f5055b48ffd732b823ca9da6d2f78c0511daab8d05490f10d087d001b417654711ff0f7dce97f3885b0fe4cf72567878532e7b004a8c37337b97d7f8'
            '399e63002acb764895bbcf3b983642c8858343b36909eeeb73133de1a9740a3d81232bc206ff6bf3daed50f72354c5e6fd5314d0d044acd9f1cb23a933b1dd74'
            '773dc0830b4eaf3a1d4134a52a6157e6a94265c6212ae8cc24b9584f9c444b9a0f822325f487ce9c23c363f743f1f64f269352f030e98e336816aee0a68048f6'
            'cbc151fc41ebffa611e144575bea463ab31a75d55ec1a331795eded3d415db8a221d24c75efe0c97c56fc33b80ffca53683af3d240af547b0d4a222d3095e960'
            'd66facb9dbe5863443d2b2383646b41fe528cb0ab967c156876852d9c6b8faac05251bdcdf584cff5d7d4d9e8ee162fe32bbfb0873d0fdb7393cf74962cd8c4f')
_src="$pkgname-$pkgver"

build() {
	#build bitwarden_rs
	cd "$srcdir/$_src"
	patch -N -i "$srcdir/0001-Disable-Vault.patch"
	patch -N -p1 -i "$srcdir/0002-Fix-OpenSSL.patch"
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
