# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=caas
pkgname=$_pkgname-git
pkgver=r282.f5d3403
pkgrel=1
pkgdesc="A web service for checking and visualising compliance status of XMPP servers."
arch=('i686' 'x86_64')
url="https://compliance.conversations.im/"
license=('BSD')
depends=('java-runtime>=10')
makedepends=('git' 'java-environment>=10' 'maven')
provides=("$_pkgname-web" "$_pkgname-app")
conflicts=("$_pkgname")
source=('git+https://github.com/iNPUTmice/caas.git' 'caas-web' 'caas-app')
md5sums=('SKIP'
         '91c4ab642924e048946ccc867a5c2a5b'
         '0fb28640305ef611f32efad761a97810')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	mvn package
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 caas-web/target/caas-web.jar $pkgdir/usr/share/java/$_pkgname-web/caas-web.jar
	install -Dm644 caas-app/target/caas-app.jar $pkgdir/usr/share/java/$_pkgname-app/caas-app.jar
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE

	cd "$srcdir"
	install -Dm755 caas-web $pkgdir/usr/bin/caas-web
	install -Dm755 caas-app $pkgdir/usr/bin/caas-app
}
