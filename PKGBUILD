# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=qdriverstation
pkgver=21.04
pkgrel=2
pkgdesc="Open source clone of the FRC Driver Station"
arch=('x86_64')
url="https://github.com/FRC-Utilities/QDriverStation"
license=('MIT')
depends=('sdl2' 'qt5-multimedia' 'qt5-quickcontrols' 'qt5-svg')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname-git}")
source=(
	"git+https://github.com/FRC-Utilities/QDriverStation.git#tag=v${pkgver}"
	"git+https://github.com/alex-spataru/QJoysticks.git#commit=23931b8772616fec6f73f25bf9e0adf76174102e"
	"git+https://github.com/FRC-Utilities/LibDS.git#commit=14cac0a7f3b911b3f1c661c3b5f455522ae6638b"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

_extractdir="QDriverStation"

prepare() {
	cd "$srcdir/${_extractdir}"
	git submodule init
	git config submodule.lib/QJoysticks.url "$srcdir/QJoysticks"
	git config submodule.lib/LibDS.url "$srcdir/LibDS"
	git submodule update
}

build() {
	cd "$srcdir/${_extractdir}"
	qmake-qt5
	make
}

check() {
	cd "$srcdir/${_extractdir}"
	make -k check
}

package() {
	cd "$srcdir/${_extractdir}"
	make INSTALL_ROOT="$pkgdir/" install

	# Install MIT license
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
