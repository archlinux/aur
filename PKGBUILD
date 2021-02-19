# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="9ddec9baf8b6e7de58c00744eb371dc68e1b6383"
pkgname=bitwarden_rs-vault
pkgver=2.18.1
pkgrel=1
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')
# python2 is included because the used npm package node-sass depends on node-gyp (and therefore python2) transitively. This issue should be solved with node-sass >4.14.1.
makedepends=('npm' 'nodejs' 'git' 'python2')
depends=('bitwarden_rs')
conflicts=("${pkgname}-"{git,bin}) 
install=bitwarden_rs-vault.install
source=("https://github.com/bitwarden/web/archive/v$pkgver.tar.gz"
	"https://github.com/bitwarden/jslib/archive/${_jslib_commit}.tar.gz"
	"0001-Set-Vault-BaseURL.patch"
	"0002-Disable-Git-Submodule-Commands.patch"
	"$pkgname.install")
sha512sums=('0dc238afff8db0325cf40bc372321b96faf2d76ea949a9c79231c3c017a8c5527dacc202a8eb85baa430bbb1ca0dee09d23eb18a57da58bbae7b3e30b6750734'
            '48765f82e2ad6b2b00be52905e35dfb8b65577711d0f1887790988b2c5e75f946f8e0c89e539a6057cd90334a4a9afa971f3b6827108d7b694e0f8dcc86545f8'
            '2ef68843f7f20eb506d8f3e3801b54885334f1d5ae774a53732ff693042d0de77bc32434185afdfb9ebb32ca3f66962065b68b7dd16b5bc967c6ffb6db9c168b'
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
