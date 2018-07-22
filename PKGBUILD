# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs
_pkgbase=bitwarden_rs
pkgver=0.11.0
pkgrel=1
pkgdesc="An unofficial lightweight implementation of the bitwarden-server using rust and sqlite. Does NOT include the web-interface."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dani-garcia/bitwarden_rs"
license=('GPL3')
depends=('openssl')
makedepends=('rust-nightly' 'cargo-nightly')
optdepends=("bitwarden_rs-vault: Web Interface 'Vault'")
conflicts=("${_pkgbase}-git" "${_pkgbase}-vault-git") 
backup=('etc/bitwarden_rs.env')
install=bitwarden_rs.install
source=("https://github.com/dani-garcia/bitwarden_rs/archive/$pkgver.tar.gz"
	"${_pkgbase}.install"
	"${_pkgbase}.service"
	"0001-Disable-Vault.patch")
sha512sums=('2c70be572a8accc819d3d045c6b6afcc7aab8db4cb8adb85d3246f5280c10d4a838e41b83b40824ef5fa244358b5ca16e9a013c928791a72be1871979f87b281'
            'f2987e720ec008372862b18479c48cd3be8c66ebe4eb2d8595b5bc238e6c18ccc7f82fd499e5ab0d701aaae60447d8e98fb8514eebe3ceac1fc4dd831974099c'
            '773dc0830b4eaf3a1d4134a52a6157e6a94265c6212ae8cc24b9584f9c444b9a0f822325f487ce9c23c363f743f1f64f269352f030e98e336816aee0a68048f6'
            '704057f0bf6d71ab9888378c3d66ee97c5019e8b18d0f22f93615fef60bef7df80a11ad7ebf5cca1cc49c90ba3f9d84515a160555e395790f325510f8a81f5cd')
_src="$pkgname-$pkgver"

build() {
	#build bitwarden_rs
	cd "$srcdir/$_src"
	patch -N -i "$srcdir/0001-Disable-Vault.patch"
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
