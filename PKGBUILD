# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="fc5fcb905fe465e99e85540f6b645c0f11b6704d"
pkgname=bitwarden_rs-vault
pkgver=2.8.0
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
sha512sums=('bb7dba7775c2822a11b22159d6e4c2493638fff1287d34797cbc618d237f4b9e37e78943efe9c1f4bc4215cf51acd3d530b227b4e4b66072c0e77d03bdd7c434'
            '6a5c020a0758f3f63862a1813df817b7672f8d7760f1fb76fb34e32221a1ba0ecca141b4df2e8c9ed1d0c91a0ae25ff467e8788baa926a7d592ddb086a513fa7'
            '08dabddcba9dc917c40e2a8e1058b2b7b7246e747a1178c7f5774366cef35c689e3058c60c3bd659f6aab3bca737c26d4b63bab19c914f35f8e91dabc388923f'
            '5265612afd40cb757e7d6550ca902f9c02c558e7d03607a181df923374efdf9eff85296c216db7c96d9987eb1fe0834a7eb90de7dcd988c9f7443dc69b9469b1')


prepare() {
	#patch paths
	cd "$srcdir/web-$pkgver"
	patch -N -p1 -i "$srcdir/0001-Set-Vault-BaseURL.patch" 
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
