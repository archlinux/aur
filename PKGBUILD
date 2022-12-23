# Maintainer: Rachel Mant <aur@dragonmux.network>
# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname=kicad-nightly
pkgver=6.99.0_5083_g987f330b19
pkgrel=1
pkgdesc='Electronic schematic and printed circuit board (PCB) design tools'
arch=('x86_64')
url='http://kicad.org/'
license=('GPL')
depends=('wxwidgets-gtk3' 'python' 'boost-libs' 'glew' 'curl' 'glm' 'ngspice' 'opencascade' 'python-wxpython' 'unixodbc')
makedepends=('git' 'cmake' 'zlib' 'mesa' 'boost' 'swig' 'ninja' 'tar' 'gzip')
options=('!strip')
optdepends=(
	'kicad-library-nightly: for footprints and symbols'
	'kicad-library-3d-nightly: for 3d models of components'
)
source=(
	'git+https://gitlab.com/kicad/code/kicad.git'#commit=987f330b19
	'kicad-nightly.env'
	'no-metadata-translation.patch'
)
sha256sums=(
	'SKIP'
	'fce26af6b9c181a99197bfc9bc6c778561ad55a375480f4d0d73bb34078b5d18'
	'649b1b0e541f22a49f1934a6173266cabde984a97fba583c3b75dd41940b86f8'
)

prepare()
{
	cd "$srcdir/kicad"

	# override default icons with nightly ones
	cp -r resources/linux/icons-nightly/hicolor/* resources/linux/icons/hicolor/

	# prevent translation of metadata files
	patch -p0 -i ../no-metadata-translation.patch
}

build()
{
	cd "$srcdir/kicad"

	rm -rf build
	mkdir build
	cd build
	cmake .. -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr/lib/kicad-nightly \
		-DCMAKE_INSTALL_DATADIR=/usr/share/kicad-nightly \
		-DCMAKE_INSTALL_DOCDIR=/usr/share/doc/kicad-nightly \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib/kicad-nightly/lib \
		-DCMAKE_EXECUTABLE_SUFFIX=-nightly \
		-DKICAD_USE_OCC=ON \
		-DKICAD_USE_EGL=ON \
		-DKICAD_SCRIPTING_WXPYTHON=ON \
		-DKICAD_BUILD_I18N=ON \
		-DKICAD_DATA=/usr/share/kicad-nightly \
		-Wno-dev
	ninja
}

package()
{
	cd "$srcdir/kicad/build"

	DESTDIR="$pkgdir" ninja install

	mkdir -p "$pkgdir/usr/share/applications"
	programs=$(ls "$pkgdir/usr/share/kicad-nightly/applications" | sed -s 's/\.desktop//g')
	for prog in $programs; do
		sed -i \
			-e 's/^Exec=\([^ ]*\)\(.*\)$/Exec=\1-nightly\2/g' \
			-e 's/^Icon=\(.*\)$/Icon=\1-nightly/g' \
			-e 's/^Name=\(.*\)$/Name=\1 nightly/g' \
			"$pkgdir/usr/share/kicad-nightly/applications/$prog.desktop"
		ln -sv "../kicad-nightly/applications/$prog.desktop" \
			"$pkgdir/usr/share/applications/${prog}-nightly.desktop"
	done

	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/kicad-nightly"
	cp kicad-nightly.env "$pkgdir/usr/share/kicad-nightly/kicad-nightly.env"

	mkdir -p "$pkgdir/usr/bin"
	(cd "$pkgdir/usr/lib/kicad-nightly/bin" && ls | grep -v '\.kiface') | while read prog; do
		cat > "$pkgdir/usr/bin/$prog-nightly" <<EOF
#!/bin/sh
. /usr/share/kicad-nightly/kicad-nightly.env
exec /usr/lib/kicad-nightly/bin/$prog "\$@"
EOF
		chmod +x "$pkgdir/usr/bin/$prog-nightly"
	done

	icons=$(find $pkgdir/usr/share/kicad-nightly/icons/ -type f -name kicad.*)
	for icon in $icons; do
		path=${icon%/*}
		relpath=${path##*/kicad-nightly/}
		basename=${icon##*/}
		extension=${basename##*.}
		filename=${basename%.*}

		mkdir -p "$pkgdir/usr/share/$relpath"
		mv "$icon" "$pkgdir/usr/share/$relpath/$filename-nightly.$extension"
	done
}
