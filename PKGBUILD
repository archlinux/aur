# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="6f43b73237fc64394441d5821bd88090b26cbe5b"
pkgname=bitwarden_rs-vault
pkgver=2.2.0
pkgrel=1
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
sha512sums=('d97c24c8d09ac18a985852a5fdf5da917f61398b0c3f771928bb2456cde1564853842733c831fe97a8c28cbd8d812d41937bdb29da40a03315b6195c8de331f5'
            '69718e2953b2a7d196d95cfb5f27beaa51b6dce23c2fbe897d292c4bb984fd8e7839cda54b163d24d0012a1103bcea3811fa73a028faa7b752c55ca22c5f93b3'
            '9a9885298fceb8de737aae0e616158ed5c41a15acbfc723048ed8d509cb40d0e32048e12b9aeb4a6a4c67485ba08f0b8e52ba7cb4d8d2036ae4dc19e39431961'
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
