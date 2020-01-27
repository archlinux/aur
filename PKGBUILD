# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="255bd3962d268bec8f66411676049803bb29e0d3"
pkgname=bitwarden_rs-vault
pkgver=2.12.0
pkgrel=2
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')

# nodejs-lts-dubnium is included because nodejs>=12 doesn't work. otherwise this would be covered by npm.
# python2 is included because the used npm package node-sass depends on node-gyp (and therefore python2) transitively. This should be covered by the official node-gyp package (https://bugs.archlinux.org/task/62277?project=5&string=node-gyp ) which is pulled in by npm.
makedepends=('npm' 'nodejs-lts-dubnium' 'python2' 'git')
depends=('bitwarden_rs')
conflicts=("bitwarden_rs-vault-git") 
install=bitwarden_rs-vault.install
source=("https://github.com/bitwarden/web/archive/v$pkgver.tar.gz"
	"https://github.com/bitwarden/jslib/archive/${_jslib_commit}.tar.gz"
	"0001-Set-Vault-BaseURL.patch"
	"0002-Disable-Git-Submodule-Commands.patch"
	"$pkgname.install")
sha512sums=('098191b55473259483bfd545d04f534627957fd19e5938f25d65b3c68ce9bc8e38c469de731a43bd141e3bb15f3b3d8761c29ce511ad4eeffc2ceacd1a5af0f9'
            'e2b8cbb83d1997899378e8a09b0bc4a6aff05d194a58ca25d29845970344579eaa70f8ab6d3ef0b93125d2971e63307692e468de3a03e5a63aa6fbe7fcc2660f'
            'cd4764f1b5ff6dc2a139da3c806d9c51c4c813acedd07afdcb19f483d8363db5f24c843c85525df4b95886e3c7b16432a26463157e53d316ae4633afe863cf7f'
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
