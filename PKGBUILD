# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>
# Based off `klayout` Arch AUR package.

_pkgname=klayout
pkgname=klayout-git
pkgver=v0.25.4.r47.g9dd603bb
pkgrel=1
pkgdesc="High Performance Layout Viewer And Editor. Support of GDS and OASIS files."
arch=('i686' 'x86_64')
url="http://www.klayout.org/"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-xmlpatterns' 'qt5-svg' 'ruby' 'python')
source=(
    'klayout::git+https://github.com/klayoutmatthias/klayout#branch=master'
	klayoutEditor.desktop
	klayoutViewer.desktop
    missingOp.patch
)
md5sums=(SKIP
         'e790f7fca3c1138e21068d7927fb8ff4'
         'e6b98e9146c476a5cb76162999964aa8'
         '553b08ddcf6c2338115a8c85ff1c948c')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/klayout"

    # Get thread count to multithread build process.
    threads="$(grep -c ^processor /proc/cpuinfo)"

	build_opt="-qmake /usr/bin/qmake
		-ruby /usr/bin/ruby
		-python /usr/bin/python3
        -j${threads}
        -qt5"

   	# apply patch
	cd ./src/db/db
	cat ../../../../../missingOp.patch | patch
	cd ../../../

	./build.sh $build_opt
}

package() {
	cd "$srcdir"
	install -D -m 644 klayoutEditor.desktop ${pkgdir}/usr/share/applications/klayoutEditor.desktop
	install -D -m 644 klayoutViewer.desktop ${pkgdir}/usr/share/applications/klayoutViewer.desktop

	cd klayout
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
