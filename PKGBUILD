# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=inviwo
pkgver=0.9.11
pkgrel=1
pkgdesc="Software framework for rapid visualization prototyping"
arch=('x86_64')
url="http://www.inviwo.org/"
license=('BSD')
depends=(
	'libjpeg'
	'libpng'
	'libtiff'
	'libtirpc'
	'python'
	'qt5-base'
	'zlib'
)
makedepends=('git' 'cmake')
_icon_url='https://avatars1.githubusercontent.com/u/10848351'
source=(
	"git+https://github.com/inviwo/inviwo.git#tag=v${pkgver}"
	"inviwo.desktop"
	"inviwo.sh"
	"icon_24.png::${_icon_url}?s=24"
	"icon_32.png::${_icon_url}?s=32"
	"icon_48.png::${_icon_url}?s=48"
	"icon_72.png::${_icon_url}?s=72"
	"icon_256.png::${_icon_url}?s=256"
)
sha256sums=('SKIP'
            'a39bce23e91e85d333c540c4b1461a3b80c4890d96fcd400657f9788aedc72a1'
            'e3d9cb272f6ad90f530c7c3f557409fae4130b5f6221c10dc7321287005f8d3d'
            '6f8bd81ba66de5739fccca7ba24fd8b96bc1ca0d13dc69fb00f046a4676aeb33'
            'abe1c9af7c61e1426a477a8ab45cdd9bde68cce0330c21df12c38f5ac41f5c80'
            '7490e3beffc315ad3c37f18879668659d572ff06069ec094d5212e467c533da4'
            '92469cc044cfef24013d04a2e0098052f82d2479eedfef75e83b2cdc8fdebd01'
            '625eb81ec86636c28f02d373d3622a87512fc3791b3b61168d69694893ff2868')

prepare() {
	cd "$srcdir/$pkgname"

	git submodule sync --recursive
	git submodule update --init --recursive

	# do not try to use the source folder as base path for the executable
	sed -i 's,IVW_TRUNK,std::string("/opt/inviwo"),' src/core/util/filesystem.cpp

	# look in the source folder for test files
	sed -i "s,filesystem::getPath(PathType::Tests),\"$srcdir/$pkgname/tests\"," \
		tests/integrationtests/image-test.cpp \
		tests/integrationtests/volume-test.cpp
	sed -i "s,filesystem::getPath(.*),\"$srcdir/$pkgname/tests/images/swirl.png\"," \
		modules/png/tests/unittests/png-savetobuffer-test.cpp
	sed -i "s,filesystem::getPath(.*),\"$srcdir/$pkgname/tests/images/swirl.\" + testExtension," \
		modules/cimg/tests/unittests/savetobuffer-test.cpp

    mkdir "${srcdir}/build" || :
    cd "${srcdir}/build"

    cmake "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX:PATH="/opt/inviwo" \
		-DIVW_USE_EXTERNAL_IMG:BOOL=ON \
		-DIVW_INTEGRATION_TESTS:BOOL=OFF
}

build() {
	cd "${srcdir}/build"
    make
}

package() {
	cd "${srcdir}/build"

	_install="$pkgdir/opt/inviwo"
	mkdir -p "$_install" "$pkgdir/usr/bin"
	cp -r bin "$_install/bin"
	cp -r lib "$_install/lib"

	install -Dm755 "$srcdir/inviwo.sh" "$_install/bin/."
	ln -s /opt/inviwo/bin/inviwo.sh "$pkgdir/usr/bin/inviwo"

	cd "$srcdir/$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cp -r data "$_install/data"
	cp -r resources "$_install/resources"
	cp -r tools "$_install/tools"
	cp -r include "$_install/include"
	cp -r modules "$_install/modules"

	cd "$srcdir"

	for res in 24 32 48 72 256; do
		install -Dm644 \
			"icon_$res.png" \
			"${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/inviwo.png"
	done

	install -Dm644 \
		inviwo.desktop \
		"$pkgdir/usr/share/applications/inviwo.desktop"
}

