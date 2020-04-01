# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=ghdl-yosys-plugin-git
pkgver=r123.ef286d8
pkgrel=1
arch=('x86_64')
pkgdesc='VHDL synthesis (based on ghdl and yosys)'
url='https://github.com/ghdl/ghdl-yosys-plugin'
license=('GPL3')

provides=('ghdl-yosys-plugin')
conflicts=('ghdl-yosys-plugin' 'ghdlsynth-beta')
replaces=('ghdlsynth-beta-git')
# By default, this AUR package is linked against community/yosys and won't work
# with yosys-git. If you want to use the plugin with yosys-git, it might be
# easiest to just build it locally.
makedepends=('git' 'clang')
depends=('ghdl-git' 'yosys')

source=("git://github.com/ghdl/ghdl-yosys-plugin.git")
sha256sums=('SKIP')
# clang-9: error: unknown argument: '-fvar-tracking-assignments'
options=(!debug)

pkgver() {
	cd "${srcdir}/ghdl-yosys-plugin"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/ghdl-yosys-plugin"

	make ghdl.so
}

package() {
	cd "${srcdir}/ghdl-yosys-plugin"

	install -Dm755 ghdl.so "$pkgdir/usr/lib/ghdl_yosys.so"

	install -dm755 "$pkgdir/$(yosys-config --datdir)/plugins/"
	ln -s /usr/lib/ghdl_yosys.so "$pkgdir/$(yosys-config --datdir)/plugins/ghdl.so"

	install -dm755 "$pkgdir/usr/share/ghdl/yosys-plugin/examples/"
	cp -r examples/* "$pkgdir/usr/share/ghdl/yosys-plugin/examples/"
}
