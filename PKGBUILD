# Maintainer: dlblv <mrdolbilov@gmail.com>
pkgname=flow5
pkgver=7.57
pkgrel=1
pkgdesc='Potential flow solver with built-in pre- and post-processing for wings, planes, hydrofoils and sails (successor to xflr5)'
arch=('x86_64')
url='https://flow5.tech'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'opencascade' 'openblas' 'gmsh' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
makedepends=('qt6-tools')
provides=('libXFoil.so' 'libflow5-lib.so' 'libflow5-io-lib.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/techwinder/flow5/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1dfcb4e7898b4d94a2b784ad5139aa09763a5faa0e3481243608c956805f9a2c')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# Arch's openblas ships libopenblas.so only; openblasp is a Fedora-only
	# name for the pthreads build.
	sed -i 's/-lopenblasp/-lopenblas/' flow5-app/flow5-app.pro flow5-lib/flow5-lib.pro

	# The subdirs project declares no inter-target dependencies, so `make -j`
	# can try to link flow5-app before its libraries exist.
	printf '\nCONFIG += ordered\n' >>flow5.pro

	# Runtime translation lookup is hardcoded to the /usr/local prefix.
	sed -i 's|"/usr/local/share/flow5/translations/"|"/usr/share/flow5/translations/"|' \
		flow5-app/globals/flow5.cpp

	# Point the desktop entry at the packaged paths. Version= is the Desktop
	# Entry spec version, not the application version.
	sed -e 's|^Exec=.*|Exec=flow5|' \
	    -e 's|^Icon=.*|Icon=flow5|' \
	    -e 's|^Version=.*|Version=1.5|' \
	    -i meta/linux/flow5.desktop
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# qmake only emits the translations install rule for .qm files that exist
	# when it runs, so compile them first.
	/usr/lib/qt6/bin/lrelease meta/translations/*.ts

	# Built in-tree: the .pro files pin DESTDIR/OBJECTS_DIR to the source dirs
	# and resolve sibling libraries through relative -L paths.
	qmake6 \
		PREFIX=/usr \
		CONFIG+=release \
		QMAKE_CFLAGS_RELEASE="$CFLAGS" \
		QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
		QMAKE_LFLAGS_RELEASE="$LDFLAGS" \
		flow5.pro
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# Installs bin/flow5, the flow5/XFoil shared libraries and their API
	# headers, share/flow5/flow5.png and the translations.
	make INSTALL_ROOT="$pkgdir" install

	install -Dm644 meta/linux/flow5.desktop \
		"$pkgdir/usr/share/applications/flow5.desktop"
	install -Dm644 meta/res/flow5.png \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/flow5.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
