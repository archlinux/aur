# Maintainer: Philipp Trommler <ph.trommler@gmail.com>
# Contributor: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
pkgname=valum-git
pkgver=v0.3.0.rc.r1.gab49bc2
pkgrel=1
pkgdesc="Web micro-framework written in Vala"
arch=("i686" "x86_64")
url="https://github.com/valum-framework/valum"
license=("LGPL3")
depends=("glib2>=2.40"
         "libsoup>=2.44"
         "fcgi")
makedepends=("git"
             "ninja>=1.6.0"
             "vala>=0.26"
             "meson>=0.33"
	     "python>=3.4"
	     "python-sphinx")
optdepends=("valadoc: for building the docs")
provides=("valum")
conflicts=("valum")
source=("git://github.com/valum-framework/valum.git")
md5sums=("SKIP")

pkgver() {
	cd valum
  	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	mkdir -p valum/_build
	cd valum/_build
	CFLAGS="-Wall -Wextra -O -march=native" meson --prefix /usr --buildtype=plain ..
	ninja
}

check() {
	cd valum/_build
	ninja test
}

package() {
	cd valum

	mkdir -p ${pkgdir}/usr/share/licenses/valum/
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/valum/LICENSE

	cd _build
	DESTDIR=${pkgdir} ninja install

	cd ${pkgdir}

	mkdir -p usr/lib
	mv usr/lib64/* usr/lib/
	rm -rf usr/lib64

	cd usr/lib/pkgconfig
	for f in `ls *pc`; do
		sed -i $f -e "s/\/lib64/\/lib/g"
	done
}
