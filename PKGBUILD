# Maintainer: Raimar Bühmann <raimar_at_buehmann dot de>

pkgname=python-elitech-git
pkgver=0.0.1.r18.20250407
pkgrel=2
pkgdesc="Command line tool and Python library for Elitech data logger"
arch=('any')
#url="https://github.com/OpenHelios/python-elitech/"
url="https://github.com/pasccom/python-elitech/"
license=('GPL-3.0')
depends=(
	'elitech-udev'
	'python'
	'python-hid-parser-elitech'
)
makedepends=(
	'python-setuptools'
	'python-build'
)
source=(
	$pkgname::git+$url
)
sha256sums=('SKIP')

pkgver() {
	# remove ".r*.*" from package version
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $pkgname
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add ".r*.*" to package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}
build() {
	cd $pkgname
	python -m build --no-isolation
}
package() {
	cd $pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl
}

