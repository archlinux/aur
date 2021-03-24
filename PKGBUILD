# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-git
pkgver=v2.18.0.r65.g1b74d22b
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
            '801651b6f1208da5f88a55c44ede614b99898e53801f681a28183c193f15c2039d4ffca5e2baa22af0399319fe6f0ef0ec37801f7c87462614ad2ae80dcbd595'
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
	git submodule update --init --recursive
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
