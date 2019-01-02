# Maintainer: Markus Richter <mqus at disroot dot org>

_jslib_commit="27566c3fd5a1040112278c7ad0a50c6b8d45e3e4"
pkgname=bitwarden_rs-vault
pkgver=2.7.1
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
sha512sums=('071b4c8808d4539fe0c454656163536e8c42ba8c0fe42d1c483f7aac5b6697dedbade95b9f50028d1fc9cf63949236e55b0f003160af10509e7a61b0f11ec9c6'
            '3c123e0106e95fb05703bce49c6328256cf3a466650948a808abdf7aa241d9a51edbc1a8d03ae5dfa9cc293e1f717bfd0c1d82b61c2c5ae96b6c773fdfcb7e0c'
            '3d676568a96ba08e5b5df31743472686f073c7677c470819a7a2decae86e5a85be032e573ff114024039138945633dd26bbc70faf212196b6dd065fc0cb0760d'
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
