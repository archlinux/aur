# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=qdriverstation-git
pkgver=r1274.917338d
pkgrel=1
pkgdesc="Open source clone of the FRC Driver Station"
arch=('i686' 'x86_64')
url="https://github.com/FRC-Utilities/qdriverstation"
license=('MIT')
groups=()
depends=('sdl2' 'qt6-declarative' 'qt6-svg' 'qt6-5compat')
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
# LTO breaks resources_big
# https://aur.archlinux.org/packages/breeze-icons-git#comment-1029266
options=('!lto')

_extractdir="${pkgname%-git}"

pkgver() {
	cd "$srcdir/${_extractdir}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_extractdir}"
	git submodule init
	git config submodule.lib/QJoysticks.url "$srcdir/QJoysticks"
	git config submodule.lib/LibDS.url "$srcdir/LibDS"
	git -c protocol.file.allow=always submodule update

	# Fix build with C23
	sed -i lib/LibDS/src/protocols.c \
	  -e 's/static void \*run_event_loop()/static void *run_event_loop(void *)/'
	sed -i src/utilities.cpp \
	  -e 's%<QRegExp>%<QtCore5Compat/QRegExp>%'
}

build() {
	cd "$srcdir/${_extractdir}"
	qmake6
	make
}

package() {
	cd "$srcdir/${_extractdir}"
	make INSTALL_ROOT="$pkgdir/" install

	# Install MIT license
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
