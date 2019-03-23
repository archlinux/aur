# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="49e06e77c4913867fc468f7d9e0b2b1529c1d181"
pkgname=bitwarden_rs-vault
pkgver=2.9.0
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
sha512sums=('59d5a0b7af37928197a60c9e8a9528d57b6cba368db43159fe96b67e85aface44743e1433e0398123e3afa933487dd91458230ba3264cd101b69dbe36c0360bf'
            '89428796d35edd09648814ed8a89b72e95b47a1a5b830855da2a319236e4fae74812f7cd5326ec7c56c87a038ba2d73ac9352764c950a362c2617e21e617b902'
            '2a7fab6ba216e854ec6c31a6dc1df899524b5c97005de38cf9ca64cac5a7ac07355fc8e19a6e6851cc4a5d784720805b83095d27dce7a5baee898a2681578070'
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
