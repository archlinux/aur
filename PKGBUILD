# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault
pkgver=1.27.0
pkgrel=2
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')
makedepends=('npm')
depends=('bitwarden_rs')
conflicts=("bitwarden_rs-vault-git") 
install=bitwarden_rs-vault.install
source=("https://github.com/bitwarden/web/archive/v$pkgver.tar.gz"
	"0001-Change-Vault-Settings.patch"
	"$pkgname.install")
sha512sums=('493588b8ec965775d0bcb58e5830d6c523131858957d5656d0480edcc93a45860606d190f0d0847ce529f43911efad4af7ca8bd2b0f21d12c05da333dcb1b4d5'
            'c2c8971abc23d874d8f822f59f1543c3f3a5bba106b146ec2065256c77209857e5915281de1b93efe8b937a1c172592e0c20b8ac1b50bf323eb54014b097156c'
            '5265612afd40cb757e7d6550ca902f9c02c558e7d03607a181df923374efdf9eff85296c216db7c96d9987eb1fe0834a7eb90de7dcd988c9f7443dc69b9469b1')


prepare() {
	#follow https://github.com/dani-garcia/bitwarden_rs/blob/master/BUILD.md AND remove the package-lock to fix gulp execution (see https://github.com/gulpjs/gulp/issues/2162 )
	cd "$srcdir/web-$pkgver"
	#fix gulp install
	rm package-lock.json
	#patch all
	patch -N -i "$srcdir/0001-Change-Vault-Settings.patch"
}

build() {
	#build vault webinterface
	cd "$srcdir/web-$pkgver"
	npm install --cache "${srcdir}/npm-cache" 

	npx gulp dist:selfHosted
}

package() {
	# install vault files
	install -d "$pkgdir/usr/share/bitwarden_rs"
	cp -r "$srcdir/web-$pkgver/dist" "$pkgdir/usr/share/bitwarden_rs/vault"
}
