# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme-git
pkgver=7.2.6.r5.gae27e6d0e
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version (git version)'
arch=('any')
optdepends=('inkscape: for generationg the symbolic icons')
url='https://github.com/Donnnno/Arcticons'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=('git+https://github.com/Donnnno/Arcticons.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/Arcticons"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/Arcticons/freedesktop-theme"
	rm -rf arcticons-dark arcticons-light || true
	./generate.sh white 2
	mv arcticons arcticons-dark
	sed -e s/Arcticons/Arcticons-dark/g -e s/breeze/breeze-dark/g index.theme > arcticons-dark/index.theme
	./generate.sh black 2
	mv arcticons arcticons-light
	rm arcticons.tar.gz
}

package() {
	cd "$srcdir/Arcticons/freedesktop-theme"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	cd "$srcdir/Arcticons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
