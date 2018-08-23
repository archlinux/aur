# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-git
pkgver=v2.1.1.r28.g34f6bc2
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
	"0001-Set-Vault-BaseURL-git.patch"
	"${pkgname%-git}.install")
sha512sums=('SKIP'
            'e79bc76448f3a310eaab825d412d85d46f77dad5372a6d48f649281ed2734f48db0f42b232add39e33434ce581042c784e10324903c8c234c0f18eb72ed1e8dd'
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
	patch -N -i "$srcdir/0001-Set-Vault-BaseURL-git.patch" "src/app/services/services.module.ts"
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
