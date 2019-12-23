# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=finite-galaxy-git
pkgver=r812.85a3dbb
pkgrel=1
epoch=
pkgdesc="A space exploration game, fork of Endless Sky"
arch=('x86_64')
url="https://github.com/finite-galaxy/finite-galaxy"
license=('GPL3')
groups=()
depends=('sdl2' 'libjpeg-turbo' 'libmad' 'glew' 'openal' 'pango' 'hicolor-icon-theme')
makedepends=('git' 'scons')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"

	sed "s/games\", sky/bin\", sky/" -i SConstruct

	cp ${pkgname%-git}.desktop.desktop ${pkgname%-git}.desktop
}

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	scons $MAKEFLAGS
}

package() {
	cd "$srcdir/$pkgname"
	scons PREFIX="/usr" DESTDIR="$pkgdir/" install
}
