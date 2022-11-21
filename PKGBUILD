# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname='chia-cli-git'
pkgver=1.7.0.b2.r15.g5f706cea27
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Latest git commit, CLI only"
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
install=chia-cli-git.install
depends=('python' 'openssl')
makedepends=('git')
conflicts=('chia-cli')
provides=('chia-cli')
options=('!strip')
source=("git+https://github.com/Chia-Network/chia-blockchain.git"
        "git+https://github.com/Chia-Network/mozilla-ca.git"
        "chia.sh")
sha256sums=('SKIP'
            'SKIP'
            'ff9b9ee5d8a8b0d8b2d2129431663b3d4a199fe47d8996cfcdf06183c48b6349')

pkgver() {
	cd chia-blockchain
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd chia-blockchain
	git submodule init mozilla-ca
	git config submodule.mozilla-ca.url "$srcdir/mozilla-ca"
	git -c protocol.file.allow=always submodule update mozilla-ca
}

build() {
	cd chia-blockchain 
	python -m venv venv
	ln -s venv/bin/activate
	source activate
	pip install --upgrade pip
	pip install wheel
	pip install --extra-index-url https://pypi.chia.net/simple/ miniupnpc==2.2.2
	pip install -e . --extra-index-url https://pypi.chia.net/simple/
}

package() {
	mkdir -p "$pkgdir/opt"
	mv chia-blockchain "$pkgdir/opt"
	install -Dm755 chia.sh "$pkgdir/usr/bin/chia"

	# replace references to srcdir with final install location
	find "$pkgdir/opt/chia-blockchain" -type f -exec sed -i "s|${srcdir}|/opt|g" {} \;
	# remove compiled python modules because they contain references to srcdir
	find "$pkgdir/opt/chia-blockchain" -name '*.pyc' -delete
}
