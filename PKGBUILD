# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-git
pkgver=v2.16.2.r0.gd823e852
pkgrel=1
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')

# python2 is included because the used npm package node-sass depends on node-gyp (and therefore python2) transitively. This issue should be solved with node-sass >4.14.1.
makedepends=('npm' 'nodejs' 'python2' 'git')
depends=('bitwarden_rs')
conflicts=("bitwarden_rs-vault" "bitwarden_rs-vault-bin")
provides=('bitwarden_rs-vault') 
install=bitwarden_rs-vault.install
source=("git+https://github.com/bitwarden/web.git"
	"0001-Set-Vault-BaseURL.patch"
	"${pkgname%-git}.install")
sha512sums=('SKIP'
            '4545846940c07216b64df1922b7742ba14fc39c0ca12115f9422125dc4716d9c9d14ce0213213f44ba6fc66a6b49b9ef28bb5943a24920059a634ebb07716634'
            '0b93ea1a442f15ac2445bc0cb759887b0826215edbc73dabb150de8ac136c8712c18b798ff397a06d50989332562a36382b5b7d962e60c2f2619d0f46cf9b04d')

pkgver() {
        cd "$srcdir/web"
        ( set -o pipefail
            git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}

prepare() {
	# patch paths
	cd "$srcdir/web"
	patch -N -p1 -i "$srcdir/0001-Set-Vault-BaseURL.patch" 
}

build() {
	# build vault webinterface
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
