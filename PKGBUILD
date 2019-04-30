# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-git
pkgver=v2.10.0.r19.g2a19bdd8
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
            '1fe9de2dca3a0199446a09d31deb7ce18cb32af9e7b7732c444e505edc1a5f834b6457d03561b5595fb2aca1120892823f8c2cdd4f96a2a8402df27155baec3a'
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
	patch -N -p1 -i "$srcdir/0001-Set-Vault-BaseURL.patch" 
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
