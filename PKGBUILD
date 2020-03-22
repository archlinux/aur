# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=ghdlsynth-beta-git
pkgver=r117.c975230
pkgrel=1
arch=('x86_64')
pkgdesc='VHDL synthesis (based on ghdl)'
url='https://github.com/tgingold/ghdlsynth-beta'
license=('GPL3')

provides=('ghdlsynth-beta' 'ghdlsynth')
conflicts=('ghdlsynth-beta' 'ghdlsynth')
makedepends=('git' 'yosys' 'clang')
depends=('ghdl-git' 'gcc-libs')

source=("ghdlsynth::git://github.com/tgingold/ghdlsynth-beta.git")
sha256sums=('SKIP')
# clang-9: error: unknown argument: '-fvar-tracking-assignments'
options=(!debug)

pkgver() {
	cd "${srcdir}/ghdlsynth"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/ghdlsynth"

	make ghdl.so
}

package() {
	cd "${srcdir}/ghdlsynth"

	install -Dm755 ghdl.so "$pkgdir/usr/lib/ghdl/ghdl_yosys.so"

	install -dm755 "$pkgdir/$(yosys-config --datdir)/plugins/"
	ln -s /usr/lib/ghdl/ghdl_yosys.so "$pkgdir/$(yosys-config --datdir)/plugins/ghdl.so"

	install -dm755 "$pkgdir/usr/share/ghdlsynth/examples/"
	cp -r examples/* "$pkgdir/usr/share/ghdlsynth/examples/"
}
