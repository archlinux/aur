# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-git
pkgver=v2.3.0.r3.g6399973
pkgrel=1
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')
makedepends=('npm')
depends=('bitwarden_rs')
conflicts=("bitwarden_rs-vault")
provides=('bitwarden_rs-vault') 
install=bitwarden_rs-vault.install
source=("git+https://github.com/bitwarden/web.git"
	"0001-Set-Vault-BaseURL.patch"
	"${pkgname%-git}.install")
sha512sums=('SKIP'
            '9a9885298fceb8de737aae0e616158ed5c41a15acbfc723048ed8d509cb40d0e32048e12b9aeb4a6a4c67485ba08f0b8e52ba7cb4d8d2036ae4dc19e39431961'
            '5265612afd40cb757e7d6550ca902f9c02c558e7d03607a181df923374efdf9eff85296c216db7c96d9987eb1fe0834a7eb90de7dcd988c9f7443dc69b9469b1')

pkgver() {
        cd "$srcdir/web"
        ( set -o pipefail
            git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}

prepare() {
	#patch paths
	cd "$srcdir/web"
	patch -N -i "$srcdir/0001-Set-Vault-BaseURL.patch" "src/app/services/services.module.ts"
}

build() {
	#build vault webinterface
	cd "$srcdir/web"
	npm install --cache "${srcdir}/npm-cache" 
	npm run sub:init --cache "${srcdir}/npm-cache" 
	npm run dist --cache "${srcdir}/npm-cache" 
}

package() {
	# install vault files
	install -d "$pkgdir/usr/share/bitwarden_rs"
	cp -r "$srcdir/web/build" "$pkgdir/usr/share/bitwarden_rs/vault"
}
