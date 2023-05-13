# Maintainer: Magnus Groß, for email contact see AUR commit author email
_pkgname=sphere
pkgname="$_pkgname"-git
pkgver=r4.98bd7ea
pkgrel=1
pkgdesc="Browser proxy app for registering different handlers for http/https URI schemes"
arch=('i686' 'x86_64')
url="https://github.com/vimpostor/$_pkgname"
license=('GPL3')
depends=(ghc haskell-regex-tdfa)
makedepends=(git cabal-install uusi)
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	gen-setup
}

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	runhaskell Setup configure --enable-shared --enable-executable-dynamic --prefix="/usr"
	runhaskell Setup build $MAKEFLAGS
}

package() {
	cd "$_pkgname"
	runhaskell Setup copy --destdir="$pkgdir"

	install -Dm 644 assets/sphere.desktop -t "$pkgdir/usr/share/applications"
}
