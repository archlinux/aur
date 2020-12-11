# Maintainer: Rachel Mant <dx-mon@users.sourceforge.net>

pkgname=kicad-nightly
pkgver=5.99.0_7506_g587d3b71be
pkgrel=1
pkgdesc='Electronic schematic and printed circuit board (PCB) design tools'
arch=('x86_64')
url='http://kicad-pcb.org/'
license=('GPL')
depends=('wxgtk3' 'python' 'boost-libs' 'glew' 'curl' 'glm' 'ngspice' 'opencascade' 'python-wxpython')
makedepends=('git' 'cmake' 'zlib' 'mesa' 'boost' 'swig' 'ninja')
options=('!strip')
optdepends=(
	'kicad-library-nightly: for footprints and symbols'
	'kicad-library-3d-nightly: for 3d models of components'
)
source=(
	'git+https://gitlab.com/kicad/code/kicad.git'#commit=587d3b71be
	'git+https://gitlab.com/kicad/code/kicad-i18n.git'#commit=e89d9a8
	'kicad-nightly.env'
)
sha256sums=(
	'SKIP' 'SKIP'
	'fce26af6b9c181a99197bfc9bc6c778561ad55a375480f4d0d73bb34078b5d18'
)

build()
{
	cd "$srcdir/kicad"

	mkdir build
	cd build
	cmake .. -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr/lib/kicad-nightly \
		-DCMAKE_INSTALL_DATADIR=/usr/share/kicad-nightly \
		-DCMAKE_INSTALL_DOCDIR=/usr/share/doc/kicad-nightly \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib/kicad-nightly/lib \
		-DCMAKE_EXECUTABLE_SUFFIX=-nightly \
		-DKICAD_USE_OCE=OFF \
		-DKICAD_USE_OCC=ON \
		-DKICAD_SCRIPTING=ON \
		-DKICAD_SCRIPTING_PYTHON3=ON \
		-DKICAD_SCRIPTING_MODULES=ON \
		-DKICAD_SCRIPTING_WXPYTHON=ON \
		-DKICAD_SCRIPTING_ACTION_MENU=ON \
		-DKICAD_SCRIPTING_WXPYTHON_PHOENIX=ON \
		-DKICAD_DATA=/usr/share/kicad-nightly \
		-DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
		-DBUILD_GITHUB_PLUGIN=ON
	ninja

	cd "$srcdir/kicad-i18n"

	mkdir build
	cd build
	cmake .. -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr/lib/kicad-nightly \
		-DCMAKE_INSTALL_DATADIR=/usr/share/kicad-nightly \
		-DCMAKE_INSTALL_DOCDIR=/usr/share/doc/kicad-nightly
	ninja
}

package()
{
	cd "$srcdir/kicad/build"
	DESTDIR="$pkgdir" ninja install

	mkdir -p "$pkgdir/usr/share"
	for prog in bitmap2component eeschema gerbview kicad pcbcalculator pcbnew; do
		sed -i \
			-e 's/^Exec=\([^ ]*\)\(.*\)$/Exec=\1-nightly\2/g' \
			-e 's/^Icon=\(.*\)$/Icon=\1-nightly/g' \
			-e 's/^Name=\(.*\)$/Name=\1 nightly/g' \
			"$pkgdir/usr/lib/kicad-nightly/share/applications/$prog.desktop"
		mv "$pkgdir/usr/lib/kicad-nightly/share/applications/$prog.desktop" \
			"$pkgdir/usr/lib/kicad-nightly/share/applications/${prog}-nightly.desktop"
	done
	mv "$pkgdir/usr/lib/kicad-nightly/share/applications" "$pkgdir/usr/share"

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/kicad-nightly"
	cp kicad-nightly.env "$pkgdir/usr/share/kicad-nightly/kicad-nightly.env"

	mkdir -p "$pkgdir/usr/bin"
	(cd "$pkgdir/usr/lib/kicad-nightly/bin" && ls | grep -v '\.kiface') | while read prog; do
		cat > "$pkgdir/usr/bin/$prog-nightly" <<EOF
#!/bin/sh
. /usr/share/kicad-nightly/kicad-nightly.env
exec /usr/lib/kicad-nightly/bin/$prog
EOF
		chmod +x "$pkgdir/usr/bin/$prog-nightly"
	done

	cd "$srcdir/kicad-i18n/build"
	DESTDIR="$pkgdir" ninja install
}
