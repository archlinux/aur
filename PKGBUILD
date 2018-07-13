# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-git
_pkgbase=bitwarden_rs
pkgver=r169.2f892cb
_vaultver=1.27.0
pkgrel=1
pkgdesc="An unofficial lightweight implementation of the bitwarden-server using rust and sqlite. Includes the web-interface 'vault'."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dani-garcia/bitwarden_rs"
license=('GPL3')
groups=()
makedepends=('rust-nightly' 'cargo-nightly' 'npm')
depends=('openssl')
provides=("$_pkgbase" "${_pkgbase}-vault") 
conflicts=("$_pkgbase" "${_pkgbase}-git" "${_pkgbase}-vault") 
replaces=()
backup=('etc/bitwarden_rs.env')
options=()
install=bitwarden_rs.install
source=('git+https://github.com/dani-garcia/bitwarden_rs.git'
	"https://github.com/bitwarden/web/archive/v$_vaultver.tar.gz"
	"0001-Change-Vault-Settings.patch"
	"0002-Set-Vault-Location.patch"
	"${_pkgbase}.install"
	"${_pkgbase}.service")
noextract=()
sha512sums=('SKIP'
            '493588b8ec965775d0bcb58e5830d6c523131858957d5656d0480edcc93a45860606d190f0d0847ce529f43911efad4af7ca8bd2b0f21d12c05da333dcb1b4d5'
            'c2c8971abc23d874d8f822f59f1543c3f3a5bba106b146ec2065256c77209857e5915281de1b93efe8b937a1c172592e0c20b8ac1b50bf323eb54014b097156c'
            '5fd4ca0f1a87170a6753b9fd4fa38b77a877a3415a936d08550ffe5dfac272974221e9d61c53b6391fff85dc6ced57113117fb0d27ba19bd07ef1b5424a2e44a'
            'e7952d8a47b1b023b00d693ef43676e4e13f4820e27447b613be51ffa18f4880e02838fc7bcef0606d537606e950d6ca535acf03ca17b38edb3b6391fa8ca043'
            '773dc0830b4eaf3a1d4134a52a6157e6a94265c6212ae8cc24b9584f9c444b9a0f822325f487ce9c23c363f743f1f64f269352f030e98e336816aee0a68048f6')


pkgver() {
	cd "$srcdir/$_pkgbase"
	( set -o pipefail
	    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
prepare() {
	cd "$srcdir/web-$_vaultver"
	#fix gulp install
	rm package-lock.json
	#patch all
	patch -N -i "$srcdir/0001-Change-Vault-Settings.patch"
}

build() {
	#build bitwarden_rs
	cd "$srcdir/$_pkgbase"
	patch -N -i "$srcdir/0002-Set-Vault-Location.patch"
	cargo build --release
	
	#build vault webinterface
	cd "$srcdir/web-$_vaultver"
	npm install
	npx gulp dist:selfHosted
}

package() {
	# setup systemd service
	install -D -m 0644 "$srcdir/bitwarden_rs.service" "$pkgdir/usr/lib/systemd/system/bitwarden_rs.service"

	# copy default config file
	install -D -m 0644 "$srcdir/$_pkgbase/.env" "$pkgdir/etc/bitwarden_rs.env"

	# install vault files
	install -d "$pkgdir/usr/share/bitwarden_rs"
	cp -r "$srcdir/web-$_vaultver/dist" "$pkgdir/usr/share/bitwarden_rs/vault"

	# copy binary
	install -D -m0755 "$srcdir/$_pkgbase/target/release/bitwarden_rs" "$pkgdir/usr/bin/bitwarden_rs"
}
