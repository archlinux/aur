# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="2f6426deb470b71838b51c52587929ac64d428bf"
pkgname=bitwarden_rs-vault
pkgver=2.4.0
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
sha512sums=('ccf560eb52e1864d0884e547efd81064d032e79f2eb154c4af673bac170f10128856d28a4f59c9520aafd0bb3f2ebb822349efc28aeae6d95a70ce66c61e3af5'
            'd502a4cd3858a076275290369d0cce492ff0af5a1bc476002edb4b65523df605f2ce4e88411c09eb016b339f0a653aa2043783bd77b6be9082cc611eb8104f21'
            '3d676568a96ba08e5b5df31743472686f073c7677c470819a7a2decae86e5a85be032e573ff114024039138945633dd26bbc70faf212196b6dd065fc0cb0760d'
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
