# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-git
_pkgbase=bitwarden_rs
pkgver=r161.869352c
_vaultver=1.27.0
pkgrel=1
pkgdesc="A lightweight implementation of the bitwarden-server using rust and sqlite. Includes the web-interface 'vault'."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dani-garcia/bitwarden_rs"
license=('GPLv3')
groups=()
makedepends=('rust-nightly' 'cargo-nightly' 'npm')
provides=("$_pkgbase" "${_pkgbase}-vault") 
conflicts=("$_pkgbase" "${_pkgbase}-git" "${_pkgbase}-vault") 
replaces=()
backup=()
options=()
install=bitwarden_rs.install
source=('git+https://github.com/dani-garcia/bitwarden_rs.git'
	"https://github.com/bitwarden/web/archive/v$_vaultver.tar.gz"
	"0001-Change-vault-paths.patch"
	"${_pkgbase}.install"
	"${_pkgbase}-vault.env"
	"${_pkgbase}.service")
noextract=()
sha512sums=('SKIP'
            '493588b8ec965775d0bcb58e5830d6c523131858957d5656d0480edcc93a45860606d190f0d0847ce529f43911efad4af7ca8bd2b0f21d12c05da333dcb1b4d5'
            'c2c8971abc23d874d8f822f59f1543c3f3a5bba106b146ec2065256c77209857e5915281de1b93efe8b937a1c172592e0c20b8ac1b50bf323eb54014b097156c'
            'ea6ac7d915887078d7e091b99d53f2ee6fbf11ad5a80e04309263e7b06ce43de6e90e69ad62e3c99eaf81f825aebe930bf45888041225a156d74f324dfa10578'
            'b41fd790ca2432030dc68608e9c96288077ccb5fbbf28c6b54ed03670583a04082be1a6cf4e1efe9f59fd831bc6b841631de96bdafb5aa732760d698ebf72468'
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
	patch -N -i "$srcdir/0001-Change-vault-paths.patch"
}

build() {
	#build bitwarden_rs
	cd "$srcdir/$_pkgbase"
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
	install -D -m 0644 "$srcdir/bitwarden_rs-vault.env" "$pkgdir/etc/bitwarden_rs.env"
	# install vault files
	install -d "$pkgdir/usr/share/bitwarden_rs"
	cp -r "$srcdir/web-$_vaultver/dist" "$pkgdir/usr/share/bitwarden_rs/vault"
	# copy binary
	install -D -m0755 "$srcdir/$_pkgbase/target/release/bitwarden_rs" "$pkgdir/usr/bin/bitwarden_rs"
}
