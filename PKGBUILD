# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-git'
pkgver=1.2.1.r20.gf708500f
pkgrel=2
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure."
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
install=chia-git.install
depends=('python' 'python-pip' 'git')
conflicts=('chia')
provides=('chia')
options=('!strip')
source=("git+https://github.com/Chia-Network/chia-blockchain.git"
        "git+https://github.com/Chia-Network/mozilla-ca#commit=6e8c42b3ef7d4ded22a994f9886e63f0060020bd")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd chia-blockchain
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mv mozilla-ca chia-blockchain
	cd chia-blockchain
	git submodule update --init mozilla-ca
}

package() {
	mkdir -p "$pkgdir/opt/chia-blockchain"
	python -m venv "$pkgdir/opt/chia-blockchain"
	ln -s "$pkgdir/opt/chia-blockchain/bin/activate" "$pkgdir/opt/chia-blockchain/activate"
	source "$pkgdir/opt/chia-blockchain/bin/activate"
	cd chia-blockchain
	pip install --upgrade pip
	pip install wheel
	pip install --extra-index-url https://pypi.chia.net/simple/ miniupnpc==2.2.2
	pip install -e . --extra-index-url https://pypi.chia.net/simple/
	find "$pkgdir/opt/chia-blockchain" -type f -exec sed -i "s|${srcdir}|/opt|g" {} \; # replace references to srcdir with final install location
	find "$pkgdir/opt/chia-blockchain" -name '*.pyc' -delete # remove compiled python modules because they contain references to srcdir
}
