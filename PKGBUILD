# Contributor: Lars Boettcher <lars@newyew.de>
# Maintainer: Aaron Ali <t0nedef@causal.ca>

pkgname=klayout
pkgver=0.25.4
pkgrel=2
pkgdesc="High Performance Layout Viewer And Editor. Support of GDS and OASIS files."
arch=('i686' 'x86_64')
url="http://www.klayout.org/"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-xmlpatterns' 'qt5-svg' 'ruby' 'python')
source=(
	http://www.klayout.org/downloads/source/klayout-${pkgver}.tar.gz
	klayoutEditor.desktop
	klayoutViewer.desktop
	missingOp.patch
)
#noextract=("klayout-${pkgver}.tar.gz")
#prepare() {
#	mkdir klayout-${pkgver}
#	bsdtar -C klayout-${pkgver} -xf klayout-${pkgver}.tar.gz
#}
build() {
	cd "$srcdir/klayout-${pkgver}"
	build_opt="-qmake /usr/bin/qmake
		-ruby /usr/bin/ruby
		-python /usr/bin/python"
	# apply patch
	cd ./src/db/db
	cat ../../../../../missingOp.patch | patch
	cd ../../../
	#
	./build.sh $build_opt
}
package() {
	cd "$srcdir"
	install -D -m 644 klayoutEditor.desktop ${pkgdir}/usr/share/applications/klayoutEditor.desktop
	install -D -m 644 klayoutViewer.desktop ${pkgdir}/usr/share/applications/klayoutViewer.desktop
	cd klayout-${pkgver}
	install -D -m 644 etc/logo.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/klayout.png
	install -D -m 755 build-release/klayout ${pkgdir}/usr/bin/klayout
	cd bin-release
	for lib in `find . -type f | grep so`; do
		install -D -m 755 $lib ${pkgdir}/usr/lib/$lib
	done
	for lib in `find . -type l | grep so`; do
		cp -a $lib ${pkgdir}/usr/lib/$lib
	done
}
#
md5sums=('972321b5561e48e5357efcb7c8c299f8'
         'e790f7fca3c1138e21068d7927fb8ff4'
         'e6b98e9146c476a5cb76162999964aa8'
         '553b08ddcf6c2338115a8c85ff1c948c')
