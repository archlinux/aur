# Maintainer: éclairevoyant

pkgname=theharvester-git
pkgver=4.2.0.r304.gd09392b
pkgrel=1
pkgdesc="Gather emails, names, subdomains, IPs and URLs related to targets using public sources"
arch=(any)
url="https://github.com/laramies/theHarvester"
license=(GPL2)
depends=(
	python-aiodns
	python-aiofiles
	python-aiohttp
	python-aiomultiprocess
	python-aiosqlite
	python-beautifulsoup4
	python-censys
	python-certifi
	python-dnspython
	python-fastapi
	python-lxml
	python-netaddr
	python-ujson
	python-pyppeteer
	python-yaml
	python-requests
	python-retrying
	python-shodan
	uvicorn
	python-uvloop
)
makedepends=(git python-{build,installer,wheel} python-setuptools)
checkdepends=(python-pytest)
install="theHarvester.install"
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# see laramies/theHarvester#1390
	rm $pkgname/tests/discovery/test_qwantsearch.py
}

build() {
	cd $pkgname
	python -m build -wn
}

check() {
	cd $pkgname
	export PYTHONPATH="$PWD/build/lib"
	python -m unittest discover
}

package() {
	cd $pkgname
	python -m installer -d "$pkgdir" dist/*.whl
}
