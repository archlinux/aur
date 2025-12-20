# Maintainer: Rachel Mant <aur@dragonmux.network>
# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname=kicad-nightly
pkgver=9.99.0_4498_ga2657db5e5
pkgrel=1
pkgdesc='Electronic schematic and printed circuit board (PCB) design tools'
arch=('x86_64')
url='https://kicad.org/'
license=('GPL-3.0-or-later')
depends=('curl' 'glew' 'glm' 'ngspice' 'opencascade' 'python' 'python-wxpython' 'wxwidgets-gtk3' 'unixodbc' 'libgit2' 'boost-libs' 'nng' 'protobuf' 'libspnav' 'poppler' 'poppler-glib')
makedepends=('git' 'cmake' 'ninja' 'mesa' 'boost' 'swig')
optdepends=(
	'kicad-library-nightly: for footprints and symbols'
	'kicad-library-3d-nightly: for 3d models of components'
)
options=('!strip')
source=(
	"$pkgname::git+https://gitlab.com/kicad/code/kicad.git"#commit=a2657db5e5
	'kicad-nightly-wrapper.sh'
	'fix-version-string.patch'
)
sha256sums=(
	'SKIP'
    '4b29df3e5f2c976d0786a3fd80f332fb4f9597aec75872a655dc15beeccd9a21'
    'e512fac78720eb31d5a89f9ce4447f33a0a733388e9a8f55db81ca38fb030e07'
)

prepare()
{
	cd "$pkgname"

	# Prevent "dirty" suffix on version string
 	patch -p1 -i "$srcdir/fix-version-string.patch"

	# Override default icons with nightly ones
	cp -p -r resources/linux/icons-nightly/hicolor/* resources/linux/icons/hicolor/
}

build()
{
	cd "$pkgname"

	local _pkgprefix="/usr/lib/$pkgname"
	local _pkglibdir="/usr/lib/$pkgname/lib"
	local _pkgdatadir="/usr/share/$pkgname"
	local _pkgdocdir="/usr/share/doc/$pkgname"

	cmake \
		-B build \
		-S . \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=$_pkgprefix \
		-DCMAKE_INSTALL_LIBDIR=$_pkglibdir \
		-DCMAKE_INSTALL_DATADIR=$_pkgdatadir \
		-DCMAKE_INSTALL_DOCDIR=$_pkgdocdir \
		-DKICAD_DATA=$_pkgdatadir \
		-DKICAD_DOCS=$_pkgdocdir \
		-DKICAD_IPC_API=ON \
		-DKICAD_SCRIPTING_WXPYTHON=ON \
		-DKICAD_USE_EGL=ON \
    	-DKICAD_USE_BUNDLED_GLEW=OFF \
		-DKICAD_BUILD_I18N=ON \
    	-DKICAD_I18N_UNIX_STRICT_PATH=ON \
    	-DKICAD_INSTALL_DEMOS=ON \
    	-DKICAD_BUILD_QA_TESTS=OFF \
		-Wno-dev

	cmake --build build
}

package()
{
	cd "$pkgname"

	local _pkgprefix="/usr/lib/$pkgname"
	local _pkglibdir="/usr/lib/$pkgname/lib"
	local _pkgdatadir="/usr/share/$pkgname"

	DESTDIR="$pkgdir" cmake --install build

	# Wrapper scripts
	mkdir -p "$pkgdir/usr/bin"
	ls -1 "$pkgdir/$_pkgprefix/bin/" | grep -v -F '.kiface' | \
		while read application; do
			local _application="$_pkgprefix/bin/$application"
			local wrapper="$pkgdir/usr/bin/$application-nightly"
			cp -p "$srcdir/kicad-nightly-wrapper.sh" "$wrapper"
			sed -i \
				-e "s/@LD_LIBRARY_PATH@/${_pkglibdir//\//\\\/}/g" \
				-e "s/@KICAD_PATH@/${_pkgdatadir//\//\\\/}/g" \
				-e "s/@APPLICATION@/${_application//\//\\\/}/g" \
				"$wrapper"
		done

	# Icons
	ls -1 "$pkgdir/$_pkgdatadir/icons/hicolor/" | \
		while read size; do
			local icon_dir="$pkgdir/$_pkgdatadir/icons/hicolor/$size"
			local dest_dir="$pkgdir/usr/share/icons/hicolor/$size"
			mkdir -p "$dest_dir/apps" "$dest_dir/mimetypes"
			ls -1 "$icon_dir/apps/" | \
				while read icon; do
					mv "$icon_dir/apps/$icon" \
					   "$dest_dir/apps/${icon%%.*}-nightly.${icon##*.}"
				done
        	ls -1 "$icon_dir/mimetypes" | grep 'kicad' | \
				while read icon; do
					mv "$icon_dir/mimetypes/$icon" \
					   "$dest_dir/mimetypes/${icon%%%%kicad*}kicad-nightly${icon#*kicad}"
				done
		done

	# MIME files
	mkdir -p "$pkgdir/usr/share/mime/packages"
	ls -1 "$pkgdir/$_pkgdatadir/mime/packages/" | \
		while read mimefile; do
			sed -i \
				-e 's/weight="[0-9]*"/weight="0"/g' \
				-e 's/priority="[0-9]*"/priority="0"/g' \
	    		-e 's/application-x-kicad/application-x-kicad-nightly/g' \
				"$pkgdir/$_pkgdatadir/mime/packages/${mimefile}"
			mv "$pkgdir/$_pkgdatadir/mime/packages/${mimefile}" \
			   "$pkgdir/usr/share/mime/packages/${mimefile%%.*}-nightly.${mimefile##*.}"
		done

	# Application launchers
	mkdir -p "$pkgdir/usr/share/applications"
	ls -1 "$pkgdir/$_pkgdatadir/applications/" | grep -F '.desktop' | \
    	while read launcher; do
			sed -i \
				-e 's/^Name\(.*\)=\([^(]*\)$/Name\1=\2 nightly/g' \
				-e 's/^Name\(.*\)=\(.*\)\( (.*\)$/Name\1=\2 nightly\3/g' \
				-e 's/^Icon=\(.*\)$/Icon=\1-nightly/g' \
				-e 's/^Exec=\([^ ]*\)\(.*\)$/Exec=\1-nightly\2/g' \
				-e 's/^StartupWMClass=\([^ ]*\)\(.*\)$/StartupWMClass=\1-nightly\2/g' \
				"$pkgdir/$_pkgdatadir/applications/$launcher"
			mv "$pkgdir/$_pkgdatadir/applications/$launcher" \
			   "$pkgdir/usr/share/applications/${launcher%.*}-nightly.desktop"
    	done

	# AppStream metainfo file
	mkdir -p "$pkgdir/usr/share/metainfo"
	sed -i \
	    -e 's/\(<id>.\+\)\(<\/id>\)$/\1_nightly\2/g' \
	    -e 's/\(<name.*>.\+\)\(<\/name>\)$/\1 Nightly\2/g' \
	    -e 's/\(<launchable.*>\).\+\(<\/launchable>\)$/\1org.kicad.kicad-nightly.desktop\2/g' \
	    -e 's/\(<binary>.\+\)\(<\/binary>\)$/\1-nightly\2/g' \
	    "$pkgdir/$_pkgdatadir/metainfo/org.kicad.kicad.metainfo.xml"
	mv "$pkgdir/$_pkgdatadir/metainfo/org.kicad.kicad.metainfo.xml" \
	   "$pkgdir/usr/share/metainfo/org.kicad.kicad_nightly.metainfo.xml"

	# TODO: locales?
}
