# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-git'
pkgver=1.1.5.r41.g1c808b6c3
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure."
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
install=chia-git.install
depends=('python' 'python-pip' 'python-websockets' 'python-wheel')
makedepends=('cmake')
conflicts=('chia')
provides=('chia')
options=('!strip')
source=("git+https://github.com/Chia-Network/chia-blockchain.git")
sha256sums=('SKIP')

pkgver() {
	cd chia-blockchain
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd chia-blockchain 
	python3 -m venv venv
	ln -s venv/bin/activate .
	. ./activate
	pip install --extra-index-url https://pypi.chia.net/simple/ miniupnpc==2.1
	pip install -e . --extra-index-url https://pypi.chia.net/simple/
}

package() {
	mkdir -p "$pkgdir/opt"
	mv chia-blockchain "$pkgdir/opt"
	find "$pkgdir/opt/chia-blockchain" -type f -exec sed -i "s|${srcdir}|/opt|g" {} \; # replace references to srcdir with final install location
	find "$pkgdir/opt/chia-blockchain" -name '*.pyc' -delete # remove compiled python modules because they contain references to srcdir
}
