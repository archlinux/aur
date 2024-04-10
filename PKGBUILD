# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=minosoft
pkgname=$_pkgname-git
pkgver=r5104.380046077
pkgrel=1
pkgdesc="Open source minecraft client, written from scratch in kotlin (and java)."
arch=('any')
url="https://gitlab.bixilon.de/bixilon/minosoft"
license=('GPL3')
depends=('java-runtime>=11' 'sh')
makedepends=('git' 'gradle' 'java-environment>=11')
optdepends=('java-runtime>=16: recommended by developer')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitlab.bixilon.de/bixilon/minosoft.git"
	'minosoft.sh'
	'minosoft.desktop')
md5sums=('SKIP'
         '6aff5163122dfb8aff3bdb0f162b588d'
         '26f1f6230fb117c558f848a08165c8d5')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	gradle clean fatJar
}

check() {
	cd "$srcdir/$_pkgname"
	gradle check
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 build/libs/minosoft-fat*.jar "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
	install -Dm644 doc/img/Minosoft_logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	cd "$srcdir"
	install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/minosoft"
	install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
