# Maintainer: Arthur Helfstein Fragoso <arthur at life dot net dot br>

pkgname=pebl2-svn
pkgver=2.1.r1468
pkgrel=1
pkgdesc="PEBL (Psychology Experiment Building Language) is a system designed for creating psychology and neuroscience experiments and tests."
arch=('any')
url="https://sourceforge.net/projects/pebl/"
license=('GPL2')
groups=()
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_net' 'sdl2_mixer' 'sdl2_gfx')
makedepends=('subversion' 'clang' 'dos2unix')
provides=('pebl2' 'pebl2-svn')
conflicts=('pebl2')
replaces=()
backup=()
options=()
source=('pebl2::svn+http://svn.code.sf.net/p/pebl/code-0/branches/sdl2')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-svn}"

  local ver="$(grep PEBL_VERSION Makefile -m 1 |sed -E 's/(^.*)=//g')"
  local rev="$(svnversion | tr -d 'A-z')"

	printf "%s.r%s" "${ver}" "${rev}"
}

build() {
	cd "$srcdir/${pkgname%-svn}"
	make
}

package() {
	cd "$srcdir/${pkgname%-svn}"
	mkdir -p "$pkgdir/usr/share/applications" #needs to be created because the Makefile assumes it exists

	make PREFIX="$pkgdir/usr/" install
	install -D -m664 "$pkgdir/usr/share/pebl2/media/images/pebl2.png" \
			 "$pkgdir/usr/share/icons/pebl2.png"
	sed -i 's/\(Icon=\).*/\1pebl2/g' $pkgdir/usr/share/applications/PEBL2.desktop
}
