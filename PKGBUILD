# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="2858724f4431038be190fc0b748efe287dd1bae6"
pkgname=bitwarden_rs-vault
pkgver=2.14.0
pkgrel=1
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')

# nodejs-lts-dubnium is included because nodejs>=12 doesn't work. otherwise this would be covered by npm.
# python2 is included because the used npm package node-sass depends on node-gyp (and therefore python2) transitively. This should be covered by the official node-gyp package (https://bugs.archlinux.org/task/62277?project=5&string=node-gyp ) which is pulled in by npm.
makedepends=('npm' 'nodejs-lts-dubnium' 'python2' 'git')
depends=('bitwarden_rs')
conflicts=("bitwarden_rs-vault-git" "bitwarden_rs-vault-bin") 
install=bitwarden_rs-vault.install
source=("https://github.com/bitwarden/web/archive/v$pkgver.tar.gz"
	"https://github.com/bitwarden/jslib/archive/${_jslib_commit}.tar.gz"
	"0001-Set-Vault-BaseURL.patch"
	"0002-Disable-Git-Submodule-Commands.patch"
	"$pkgname.install")
sha512sums=('eebc1a0db9e962144c052db721a20180383bd21ae0a1f086da0e71a53f4caccbefd136adbdee8c7945e39a5426e2c3acbddd118d0eb89927b11b2f8201bc145b'
            '545fa623f9b2774250ecb5c19222ee0cfaa1ee630fdb1f82c061d35baa8bae50a5ec3a3ba690d626fd81056bf7e029b4b2b43a2657897d27380ee49e372137e7'
            'bb4d3bdec5e9868f316bd74e07e2bfc6cc412a6bf0d38ddace98278806ca6aff487cec2cb4fdfb87b3af68103eb175a636c3f8dc6ed5710f5780f36c21f5dd8f'
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
