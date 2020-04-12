# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="31a257407be7f8f47624b0d021363aaf2cfda2d7"
pkgname=bitwarden_rs-vault
pkgver=2.13.2
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
sha512sums=('06635f1b29ed4beb68846d2982a5d945919b107646b4648ec8eaabc786f616ae8d1aa7073a44074e9e6820aea31b4c17a3c98aeee9453a537b04f0760bb65337'
            '3103cfaae0b46f4c32ce4c70ef2ef34ec96048cd480151b381add63b82d57e1c1c385ef72a998999f077b3c23008eb995a18d8f829bae95e89fb8b2348e0840b'
            '642aec31a9d9c702b100cecca89f2e815fc8265fc61d9c8b096922c7c6cd9fec2bed353e191e985b154dd2c8576c2be22efeda69f3aac6aaea1560e50fa95ae4'
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
