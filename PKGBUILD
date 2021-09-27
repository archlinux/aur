# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=ghdl-yosys-plugin-git
pkgver=r187.d7536e6
pkgrel=2
arch=('x86_64')
pkgdesc='VHDL synthesis (based on ghdl and yosys)'
url='https://github.com/ghdl/ghdl-yosys-plugin'
license=('GPL3')

provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
makedepends=('git')
depends=('ghdl-git' 'yosys>0.9')

source=("git://github.com/ghdl/ghdl-yosys-plugin.git")
sha256sums=('SKIP')

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
