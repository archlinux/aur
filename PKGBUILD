# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="85587e06728aabd118f3cb6b06110be92202049b"
pkgname=bitwarden_rs-vault
pkgver=2.3.0
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
	"$pkgname.install")
sha512sums=('dbc8ef2ffd875258ed975221bc417a53f0b1316acaaa4f4ecd19c5342fefd4737a897a328fd8936dfe04d4c4bb26791863f0c6f990a65d38828d9082082b6471'
            'bdd4ea0e1b8e5e81d304426fd2bd4d63f584f8628d79a85cb320c909b3b11bf02bb1ddc7c3deaef69f0746577f9a751af1f1c31586be891a95fe41fc22f05134'
            '9a9885298fceb8de737aae0e616158ed5c41a15acbfc723048ed8d509cb40d0e32048e12b9aeb4a6a4c67485ba08f0b8e52ba7cb4d8d2036ae4dc19e39431961'
            '5265612afd40cb757e7d6550ca902f9c02c558e7d03607a181df923374efdf9eff85296c216db7c96d9987eb1fe0834a7eb90de7dcd988c9f7443dc69b9469b1')


prepare() {
	#patch paths
	cd "$srcdir/web-$pkgver"
	patch -N -i "$srcdir/0001-Set-Vault-BaseURL.patch" "src/app/services/services.module.ts"
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
