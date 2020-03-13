# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="0a30c7eb1ecbac500e6c55a7d4024d98efa982bc"
pkgname=bitwarden_rs-vault
pkgver=2.13.1
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
sha512sums=('ce6df30c342851bff8cc6d2ca598b98a131aedf63ef32c195e552e3dfd0540f3aa33cff825d45ad159855446de32a574feb76df3af211ccfb9c288347f4c5e37'
            'c6ce73345e59b77689aca8a59da539ddb9efc8f7ed77e2172397e8fe959a68448bb576d1ff0bbe1615de45e45113210e1ef94cd632a0111559dd7f125a622c52'
            'cd4764f1b5ff6dc2a139da3c806d9c51c4c813acedd07afdcb19f483d8363db5f24c843c85525df4b95886e3c7b16432a26463157e53d316ae4633afe863cf7f'
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
