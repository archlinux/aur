# Maintainer: Cain Atkinson <yellowsink@riseup.net>

pkgname=cozette-drawing-git
pkgver=r151.b6752ee
pkgrel=1
pkgdesc="Patch to make Cozette's braille characters take up their entire space."
arch=(any)
url="https://github.com/redstonekasi/cozette-drawing"
license=(MIT)
groups=()
depends=()
makedepends=(git fontforge python-pipenv pyenv java-runtime-headless)
source=('cozette::git+https://github.com/slavfox/cozette' 'drawing::git+https://github.com/redstonekasi/cozette-drawing')
sha256sums=(SKIP SKIP)

pkgver() {
	cd "${srcdir}/cozette"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# patch
	cd "${srcdir}/cozette"
	git am -k ../drawing/braille.diff
	# this diff broken atm
#	git am -k ../drawing/custom-name.diff
	sed -i 's/Cozette/CozetteDrawing/g' Cozette/Cozette.sfd
}

build() {
	# build font
	cd "${srcdir}/cozette"
	pipenv install --python /usr/bin/python
	
	pipenv run python build.py fonts

	pipenv --rm
}

package() {
	cd "${srcdir}/cozette/build"

	install -vDm 644 cozette.otb           -t "${pkgdir}/usr/share/fonts/cozette_drawing/"
	install -vDm 644 cozette_hidpi.otb     -t "${pkgdir}/usr/share/fonts/cozette_drawing/"
	install -vDm 644 CozetteVector.ttf     -t "${pkgdir}/usr/share/fonts/cozette_drawing/"
	install -vDm 644 CozetteVectorBold.ttf -t "${pkgdir}/usr/share/fonts/cozette_drawing/"

	install -vDm 644 ../LICENSE            -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
