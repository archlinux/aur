# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="57ace4084556758fdc2989cf1a8cf6a5d1736a29"
pkgname=bitwarden_rs-vault
pkgver=2.15.1
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
sha512sums=('971f23cd00c83160425f25ad8d7eca8fe78f652553f76d838f8476399ed5721234d08201359d8d85a0582b95930451521316f2af8c7c59436edc44f1ae6a19c4'
            '771c7d61a17c6f8066e61d17895ab89ee188db43111de774ff7488bc701cc5e10e56f45e18e5bbd5b13cbf5bc54d6cb7d8bc7df4cff3ba62b71d0432d30ac8cf'
            '6999c52081caa80ea21c43cc9b2c416a23879aa59eb7be4acd59ff669d42aec493f6525101d3fe81a2c5a5a222af6f8ec2789ebb907152c40b7a5661171fdeef'
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
