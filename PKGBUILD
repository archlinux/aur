pkgname=urlregwatch
pkgver=0.1.3.r19.20160331
pkgrel=1
pkgdesc="Check internet pages for changes by regular expression"
url=http://urlregwatch.sourceforge.net/
license=(LGPL3)
arch=(any)
depends=(java-environment)
makedepends=(gradle)
source=($pkgname::git+https://github.com/OpenHelios/urlregwatch.git)
sha1sums=(SKIP)

_gitroot=$pkgname

pkgver() {
	# remove ".r*.*" from package version
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $_gitroot
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add ".r*.*" from package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}

build() {
	cd $_gitroot
	gradle build
}

package() {
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $_gitroot
	install -Dm755 linux/$pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 build/libs/$pkgname-$_pkgverTriple.jar $pkgdir/usr/lib/$pkgname/$pkgname.jar
}
