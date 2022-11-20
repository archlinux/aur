# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname='chia-git'
pkgver=1.7.0.b2.r15.g5f706cea27
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Latest git commit, provides GUI"
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
install=chia-git.install
depends=('python' 'nodejs' 'electron' 'openssl')
makedepends=('npm' 'git')
conflicts=('chia' 'chia-cli')
provides=('chia' 'chia-cli')
options=('!strip')
source=("git+https://github.com/Chia-Network/chia-blockchain.git"
        "git+https://github.com/Chia-Network/chia-blockchain-gui.git"
        "git+https://github.com/Chia-Network/mozilla-ca.git"
        "chia.sh"
        "chia-gui.sh"
        "chia.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'ff9b9ee5d8a8b0d8b2d2129431663b3d4a199fe47d8996cfcdf06183c48b6349'
            'dc42fea5581ee9ecc2b6e386b379ba3eaecabee0c92bab4b05bc5016cff3d1a4'
            'f5374d9ed5f67567256c2df919559882a72db47709a42df820a44bad1bedd285')

pkgver() {
	cd chia-blockchain
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd chia-blockchain
	git submodule init
	git config submodule.mozilla-ca.url "$srcdir/mozilla-ca"
	git config submodule.chia-blockchain-gui.url "$srcdir/chia-blockchain-gui"
	git -c protocol.file.allow=always submodule update
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

	cd chia-blockchain-gui
	npm install
	npm run build
}

package() {
	mkdir -p "$pkgdir/opt"
	mv chia-blockchain/chia-blockchain-gui/packages/gui chia-blockchain
	rm -rf chia-blockchain/chia-blockchain-gui
	rm -rf chia-blockchain/gui/node_modules
	mv chia-blockchain "$pkgdir/opt"

	install -Dm755 chia.sh "$pkgdir/usr/bin/chia"
	install -Dm755 chia-gui.sh "$pkgdir/usr/bin/chia-gui"
	install -Dm644 chia.desktop "$pkgdir/usr/share/applications/chia.desktop"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	ln -s /opt/chia-blockchain/gui/src/assets/img/chia_circle.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/chia.svg"

	# remove "../../../" based on buildtime directory layout
	find "$pkgdir/opt/chia-blockchain/gui" -type f -exec sed -i "s|\.\./\.\./\.\./||g" {} \;
	# replace references to srcdir with final install location
	find "$pkgdir/opt/chia-blockchain" -type f -exec sed -i "s|${srcdir}|/opt|g" {} \;
	# remove compiled python modules because they contain references to srcdir
	find "$pkgdir/opt/chia-blockchain" -name '*.pyc' -delete
}
