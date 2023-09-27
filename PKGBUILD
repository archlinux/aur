# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=qdriverstation-git
pkgver=r1271.c18daf7
pkgrel=3
pkgdesc="Open source clone of the FRC Driver Station"
arch=('i686' 'x86_64')
url="https://github.com/FRC-Utilities/qdriverstation"
license=('MIT')
groups=()
depends=('sdl2' 'qt5-multimedia' 'qt5-quickcontrols' 'qt5-svg')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=(
	"qdriverstation::git+https://github.com/FRC-Utilities/QDriverStation.git"
	"git+https://github.com/alex-spataru/QJoysticks.git"
	"git+https://github.com/FRC-Utilities/LibDS.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.lib/QJoysticks.url "$srcdir/QJoysticks"
	git config submodule.lib/LibDS.url "$srcdir/LibDS"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake-qt5
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install

	# Install MIT license
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
