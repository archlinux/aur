# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-gui-git'
pkgver=1.1.1.r14.ge7304c59
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Also installs GUI"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
depends=('python' 'python-pip' 'python-websockets' 'python-wheel' 'npm' 'nodejs' 'gtk3')
makedepends=('cmake')
conflicts=('chia' 'chia-gui')
provides=('chia' 'chia-gui')
options=('!strip')
source=("git+https://github.com/Chia-Network/chia-blockchain.git"
        "git+https://github.com/Chia-Network/chia-blockchain-gui.git"
        "chia-gui.desktop"
        "chia-gui.sh")
sha256sums=('SKIP'
            'SKIP'
            '62693edb1a75f2a44b62d1a4f02b1ae755d40eb02dd7faf5f65ea6253e5e3645'
            '51fe7c07eaf44bab143e8622e163e9e2d1953cae5d6988bdf107fd689a2da0e0')

pkgver() {
	cd chia-blockchain # using other repo since gui repo doesn't have any tags yet
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	mv chia-blockchain-gui chia-blockchain
	cd chia-blockchain
	python3 -m venv venv
	ln -s venv/bin/activate .
	. ./activate
	pip install https://download-chia-net.s3-us-west-2.amazonaws.com/simple/miniupnpc/miniupnpc-2.1.tar.gz
	pip install -e .
	cd chia-blockchain-gui
	npm install
	npm audit fix
	npm run locale:extract
	npm run locale:compile
	npm run build
}

package() {
	install -Dm644 chia-blockchain/chia-blockchain-gui/src/assets/img/circle-cropped.png "$pkgdir"/usr/share/pixmaps/chia.png
	install -Dm755 chia-gui.sh "$pkgdir"/usr/bin/chia-gui
	install -Dm644 chia-gui.desktop "$pkgdir"/usr/share/applications/chia-gui.desktop
	mkdir -p "$pkgdir"/opt
	mv chia-blockchain "$pkgdir"/opt
}
