# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="4ca7a9709e9ccd0e67ce09309ae605f2057bf089"
pkgname=bitwarden_rs-vault
pkgver=2.1.1
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
	"https://github.com/bitwarden/jslib/archive/${_jslib_commit}.tar.gz"
	"0001-Set-Vault-BaseURL.patch"
	"$pkgname.install")
sha512sums=('c5a61ecda4b7ea010c62f561c85ae325dc71a22af898809dd3a853f311b404354bd9bbd81b58f3edd1e438df881abda51d972d5a40fa53d3776a6cd261ab00c5'
            '4a59194a426a91df029cfd3b8ebc576d2033bdaafa3daa47c89b1405f646af27e9c6b6793a3735cedd46efe0c99e8010565905885cff714573600bdc4265f854'
            '7f69c25e19f6cc1dac3e227b764e664af66f89cf05f4b0f21fa427624e698cf96066ee85ccc8d0cb65fbb3fd97336897784c5895dfc4a7a5f2f3cd62c5114791'
            '5265612afd40cb757e7d6550ca902f9c02c558e7d03607a181df923374efdf9eff85296c216db7c96d9987eb1fe0834a7eb90de7dcd988c9f7443dc69b9469b1')


prepare() {
	#patch paths
	cd "$srcdir/web-$pkgver"
	patch -N -i "$srcdir/0001-Set-Vault-BaseURL.patch" "src/app/services/services.module.ts"
	#simulate git-submodules
	rmdir jslib
	ln -s "../jslib-${_jslib_commit}" jslib

}

build() {
	#build vault webinterface
	cd "$srcdir/web-$pkgver"
	npm install --cache "${srcdir}/npm-cache" 
	npm run dist --cache "${srcdir}/npm-cache" 
}

package() {
	# install vault files
	install -d "$pkgdir/usr/share/bitwarden_rs"
	cp -r "$srcdir/web-$pkgver/build" "$pkgdir/usr/share/bitwarden_rs/vault"
}
