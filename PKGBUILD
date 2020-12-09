# Maintainer: Markus Richter <mqus at disroot dot org>
# Contributor: Timothée Ravier <tim@siosm.fr

pkgname=bitwarden_rs-sqlite
_pkgbase=bitwarden_rs
pkgver=1.17.0
pkgrel=1
pkgdesc="An unofficial lightweight implementation of the bitwarden-server using rust and sqlite. Does NOT include the web-interface."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dani-garcia/bitwarden_rs"
license=('GPL3')
depends=('openssl')
makedepends=('rust-nightly' 'cargo-nightly')
optdepends=("bitwarden_rs-vault: Web Interface 'Vault'")
conflicts=("${_pkgbase}" "${_pkgbase}-git" "${_pkgbase}-mysql" "${_pkgbase}-postgresql")
backup=('etc/bitwarden_rs.env')
install=bitwarden_rs.install
source=("https://github.com/dani-garcia/bitwarden_rs/archive/$pkgver.tar.gz"
	"${_pkgbase}.install"
	"${_pkgbase}.service"
	"${_pkgbase}.sysusers.conf"
	"${_pkgbase}.tmpfiles.conf"
	"0001-Disable-Vault.patch")
sha512sums=('f983d225b42ddcc561502aa0bc2820c0fb362307c3ac1181c568c3ab4cb6a08eb40c70c88c5fef7967bb952b1bb7d754338720028438f49b3ba4e7a7e1d62d76'
            'ae1e05b613d3178bf3fa273ff6661c567140a43826e681b5164ef7d101c1243e5ff93e9caf7193984626d363b8b8b7c076e6646b865699d4cbe482a3dc4f91e7'
            '6f6b05881ee3344bdc553fae00a709404ddd086af347f909b3f3a620aabd2294b7dd2892472cd72515e9ceced2449eacbd9ef24626a1429776ea4599673a665b'
            '15b00b0dc9122f98ce8d7b55668fdfbb2e0387563e7d9ad6c0ebc73b75e46e1ccdb3a2186a453795a1b3e2d45358ff5a8076d5cf30319ab2c21539d20cff81c6'
            '6fd0ea962f077f92ad7f55a1bab479e68e3463b41eb171d501847554b676b7ecf05e016544f6331bdb53bf71038fcf2ce67ad213d0a7c2f93acbafd72e8441a6'
            '9e0bf89b2e1196402e744244b09257d58958a8fa4b78aabc556571781a1cb05e900e15877f884592e2796c24d631e353d715f202238260055e7d2e8f77cafc58')
_src="$_pkgbase-$pkgver"

build() {
	# rustup is not required, but if it exists, we have to set the profile. Otherwise, fail silently.
	# This is necessary because some of the optional toolchain components (e.g. clippy) fail regularly on nightly and rustup/cargo will fail if it can't download those.
	RUSTUP_PROFILE=`rustup show profile 2>/dev/null`
	rustup set profile minimal 2>/dev/null && echo "Set rustup profile to 'minimal'. Will reset to '$RUSTUP_PROFILE' after a successful build."

	#build bitwarden_rs
	cd "$srcdir/$_src"
	patch -N -p1 -i "$srcdir/0001-Disable-Vault.patch"

	BWRS_VERSION="$pkgver-archlinux-sqlite-$pkgrel" cargo build --release --locked --features sqlite

	rustup set profile $RUSTUP_PROFILE 2>/dev/null && echo "Set rustup profile back to '$RUSTUP_PROFILE'."
}

check() {
	cd "$srcdir/$_src"
	cargo test --release --locked --features sqlite
}

package() {
	# setup systemd service
	install -D -m 0644 "$srcdir/bitwarden_rs.service" "$pkgdir/usr/lib/systemd/system/bitwarden_rs.service"
	
	# declarative setup of user and directory
	install -D -m 0644 "$srcdir/bitwarden_rs.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/bitwarden_rs.conf"
	install -D -m 0644 "$srcdir/bitwarden_rs.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/bitwarden_rs.conf"
	
	# copy default config file
	install -D -m 0644 "$srcdir/$_src/.env.template" "$pkgdir/etc/bitwarden_rs.env"
	
	# copy binary
	install -D -m 0755 "$srcdir/$_src/target/release/bitwarden_rs" "$pkgdir/usr/bin/bitwarden_rs"
}
