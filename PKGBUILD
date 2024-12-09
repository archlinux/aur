# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>

pkgname=tragediy-git
pkgver=0.1.0.r34.20241209
pkgrel=1
pkgdesc="Generate printable tracks for Anki (Over)Drive vehicles"
arch=('i686' 'x86_64')
#url="https://github.com/NoveroResearch/tragediy"
url="https://github.com/OpenHelios/tragediy"
license=('GPL')
depends=('boost-libs') # for libboost_program_options.so
makedepends=('cmake' 'gcc' 'boost')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')
pkgver() {
	# remove ".r*.*" from package version
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $pkgname
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add ".r*.*" from package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}
build() {
	cd "$pkgname"
	mkdir -p build
	cd build
	cmake ..
	cmake --build .
}
package() {
	cd "$pkgname/build"
	cmake --install . --prefix "$pkgdir/usr"
}
