# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="692d1ec20163edaa404b52888af2ea45b13b59cd"
pkgname=bitwarden_rs-vault
pkgver=2.11.0
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
	"0002-Disable-Git-Submodule-Commands.patch"
	"$pkgname.install")
sha512sums=('06cb7d1e39b72fc1bba5823a67716a932dafba126387a4049481857c5a7af41ca2e4b56bbebda1d283429981b65688c5fbc0535007d52a10c89f06c16784e7ab'
            '92297cc98b655fe3e8c45983f5c58c9af8615012e0ce4177522a461592cf1c1d50110f837cdab67246fe70e76d66e14e849de4c0886e6385df4743691ad96ddd'
            '1a47ae5a1e5664fb207dc021c59b36fe31d3641282b53fdd6092176fa44c86915c8a209619c07f0a031ca7153a1a69514ae9e1d29c3bfcd4fb27fd3ab24a677a'
            'adaa6037e59f08a6a44f681c8eab915c0738069989f9d6acbf46e4d3135f69696fa7735a65158979fbc924b27f43bdf255648e615b33495ac7da418e89f27c90'
            '5265612afd40cb757e7d6550ca902f9c02c558e7d03607a181df923374efdf9eff85296c216db7c96d9987eb1fe0834a7eb90de7dcd988c9f7443dc69b9469b1')


prepare() {
	#patch paths
	cd "$srcdir/web-$pkgver"
	patch -N -p1 -i "$srcdir/0001-Set-Vault-BaseURL.patch"
	# fix for AUR-snapshot tarballs
	patch -N -p1 -i "$srcdir/0002-Disable-Git-Submodule-Commands.patch"
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
