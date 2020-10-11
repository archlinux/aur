# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="f30d6f8027055507abfdefd1eeb5d9aab25cc601"
pkgname=bitwarden_rs-vault
pkgver=2.16.2
pkgrel=1
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')
# python2 is included because the used npm package node-sass depends on node-gyp (and therefore python2) transitively. This issue should be solved with node-sass >4.14.1.
makedepends=('npm' 'nodejs' 'git' 'python2')
depends=('bitwarden_rs')
conflicts=("bitwarden_rs-vault-git" "bitwarden_rs-vault-bin") 
install=bitwarden_rs-vault.install
source=("https://github.com/bitwarden/web/archive/v$pkgver.tar.gz"
	"https://github.com/bitwarden/jslib/archive/${_jslib_commit}.tar.gz"
	"0001-Set-Vault-BaseURL.patch"
	"0002-Disable-Git-Submodule-Commands.patch"
	"$pkgname.install")
sha512sums=('ffbfa7e2fa5cc47289062a7f1147f26be7312c7f0404235b1756acc776e372ab5525221957ea7cc4a5595409504d8705553425758ba166d210c5255620acc78f'
            '1801f91af9a52f0d1364137c40bc2382cc4b683206b73c6effc26ad81c547341b156713617f7c692402b77b8861cfb60ef6b2c3385d5f31a006ac4d53e6e0389'
            '4545846940c07216b64df1922b7742ba14fc39c0ca12115f9422125dc4716d9c9d14ce0213213f44ba6fc66a6b49b9ef28bb5943a24920059a634ebb07716634'
            'adaa6037e59f08a6a44f681c8eab915c0738069989f9d6acbf46e4d3135f69696fa7735a65158979fbc924b27f43bdf255648e615b33495ac7da418e89f27c90'
            '0b93ea1a442f15ac2445bc0cb759887b0826215edbc73dabb150de8ac136c8712c18b798ff397a06d50989332562a36382b5b7d962e60c2f2619d0f46cf9b04d')


prepare() {
	cd "$srcdir/web-$pkgver"
	
	# patch paths
	patch -N -p1 -i "$srcdir/0001-Set-Vault-BaseURL.patch"
	
	# fix for AUR-snapshot tarballs
	patch -N -p1 -i "$srcdir/0002-Disable-Git-Submodule-Commands.patch"
	
	# simulate git-submodules
	rmdir jslib
	ln -s "../jslib-${_jslib_commit}" jslib

}

build() {
	# build vault webinterface
	cd "$srcdir/web-$pkgver"
	npm install --cache "${srcdir}/npm-cache" 
	npm run dist --cache "${srcdir}/npm-cache" 
}

package() {
	# install vault files
	install -d "$pkgdir/usr/share/bitwarden_rs"
	cp -r "$srcdir/web-$pkgver/build" "$pkgdir/usr/share/bitwarden_rs/vault"
}
