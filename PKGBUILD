# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname='chia-git'
pkgver=1.3.5.r1165.gdd4d7d031
pkgrel=1
epoch=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Latest git commit, provides GUI"
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
depends=('chia-cli-git' 'electron')
makedepends=('nodejs' 'npm' 'git')
conflicts=('chia')
provides=('chia')
options=('!strip')
source=("git+https://github.com/Chia-Network/chia-blockchain-gui.git"
        "chia-gui.sh"
        "chia.desktop")
sha256sums=('SKIP'
            'dc42fea5581ee9ecc2b6e386b379ba3eaecabee0c92bab4b05bc5016cff3d1a4'
            'f5374d9ed5f67567256c2df919559882a72db47709a42df820a44bad1bedd285')

pkgver() {
	cd chia-blockchain-gui
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd chia-blockchain-gui
	source /opt/chia-blockchain/venv/bin/activate
	npm install
	npm run build
}

package() {
	mkdir -p "$pkgdir/opt/chia-blockchain/gui"
	mv chia-blockchain-gui/packages/gui/build "$pkgdir/opt/chia-blockchain/gui"
	mv chia-blockchain-gui/packages/gui/package.json "$pkgdir/opt/chia-blockchain/gui"

	# remove "../../../" based on buildtime directory layout
	find "$pkgdir/opt/chia-blockchain/gui" -type f -exec sed -i "s|\.\./\.\./\.\./||g" {} \;

	install -Dm755 chia-gui.sh "$pkgdir/usr/bin/chia-gui"
	install -Dm644 chia.desktop "$pkgdir/usr/share/applications/chia.desktop"
	install -Dm644 chia-blockchain-gui/packages/gui/src/assets/img/chia_circle.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/chia.svg"
}
