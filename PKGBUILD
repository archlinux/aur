# Maintainer: Markus Richter <mqus at disroot dot org>
# Contributor: Timothée Ravier <tim@siosm.fr

pkgname=bitwarden_rs
_pkgbase=bitwarden_rs
pkgver=1.14.1
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
	"${_pkgbase}.sysusers.conf"
	"${_pkgbase}.tmpfiles.conf"
	"0001-Disable-Vault.patch")
sha512sums=('223469e4c276d21e8d85cc24df2b71896580c516201ec5a238676c8cdfa19ed0b18c6475fdaedc8117265002f38aee81b93d39fd5b77e27dc5e467126e5304a1'
            'ae1e05b613d3178bf3fa273ff6661c567140a43826e681b5164ef7d101c1243e5ff93e9caf7193984626d363b8b8b7c076e6646b865699d4cbe482a3dc4f91e7'
            '60a406c8fea4bb651974b3fd386f66a0fcf73bfcc29bffe171b92134e2e81b6374ac6be879eb420208ecd77911b7d157db587510347e56ecb72aec34ac90fbe6'
            '15b00b0dc9122f98ce8d7b55668fdfbb2e0387563e7d9ad6c0ebc73b75e46e1ccdb3a2186a453795a1b3e2d45358ff5a8076d5cf30319ab2c21539d20cff81c6'
            '6fd0ea962f077f92ad7f55a1bab479e68e3463b41eb171d501847554b676b7ecf05e016544f6331bdb53bf71038fcf2ce67ad213d0a7c2f93acbafd72e8441a6'
            '9fde678747d120704d0d99751af1eebd89ba2643af5917da9d9d2a8712fe5bb6ef1d3545d3b669467d14cab51c0c1514853364f323ff92bab7e7ed8501fe5b56')
_src="$pkgname-$pkgver"



build() {
	#build bitwarden_rs
	cd "$srcdir/$_src"
	patch -N -p1 -i "$srcdir/0001-Disable-Vault.patch"
	cargo build --release --locked --features sqlite
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
