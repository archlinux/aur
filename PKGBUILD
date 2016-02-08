# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Timo Bußhaus <arch AT mockfrog DOT de>
pkgname=tttool-git
_prjname=tip-toi-reveng
pkgver=1.6
pkgrel=1
pkgdesc="tool for compiling and decompiling gme files for tiptoi pen"
arch=('i686' 'x86_64')
url="http://tttool.entropia.de"
license=('custom')
groups=()
depends=('gmp' 'libffi' 'zlib')
makedepends=('git' 'ghc' 'cabal-install' 'chrpath')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("git+https://github.com/entropia/${_prjname}.git#tag=${pkgver}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_prjname}"
	printf "%s" "$(git describe --tags | sed 's/-.*//')"
}

build() {
	cd "$srcdir/${_prjname}"
	cabal sandbox init
	cabal install --dependencies-only
	cabal build

}

package() {
	cd "$srcdir/${_prjname}"
	install -Dp -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dp -m755 dist/build/tttool/tttool "${pkgdir}/usr/bin/tttool"
	chrpath --delete "${pkgdir}/usr/bin/tttool"
	
}
