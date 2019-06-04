# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="741e060d999c7b40e98b5b2b8afab4e43d59afcb"
pkgname=bitwarden_rs-vault
pkgver=2.10.1
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
sha512sums=('1020c94e2167a4e37813dc63c489b19e7ec8d5a9f863b2d904cab1768e1dea35c4c756f3fae974fed958107b7d0b86d4bea82afacda4da8b00d843657368cd75'
            'a0be963cd6f96c27f8a8750cce739aae50b3a35a91d7f268496d03680b8e2b669faed2198222d03e3629e1b5380f8ea9da06db56474172be6708ca4d0f9e431f'
            '02bada10c338b8fd6fd792b1d5f275109d296416a0f75f03399a763bf4edb5d2594352511169997c1ec7e532af0335bb322a925bb7f91d0bb067dadaca5a3bd8'
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
