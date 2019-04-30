# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="a884f779381d0958ce31a99c2cd9e62cd9fba521"
pkgname=bitwarden_rs-vault
pkgver=2.10.0
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
sha512sums=('da245c94eadfec2d26ad78f1591154ca5eb1205b932169687e8445b49fac4225b6e861bc68848e59763bd89258c599c06fbff530fd1742332296b594100f5307'
            '4d1f84d3779afadf5d488320ab420a859a3a6f8bc25efb2533fc950daae7753f5068ded6f95690ced81388e00e93a5dd1af1297a07afe2e0f6deff78760ba465'
            '1fe9de2dca3a0199446a09d31deb7ce18cb32af9e7b7732c444e505edc1a5f834b6457d03561b5595fb2aca1120892823f8c2cdd4f96a2a8402df27155baec3a'
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
