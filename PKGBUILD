# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=(bsf-git bsf-docs-git)
pkgbase=bsf-git
_pkgname=bsf
pkgver=r5221.41e122d24
pkgrel=1
epoch=
pkgdesc="A C++ library that aims to provide a unified foundation for the development of real-time graphical applications, whether games, engines or tools"
arch=(x86_64)
url="https://www.bsframework.io/"
license=('MIT')
groups=()
makedepends=(git cmake doxygen ninja)
checkdepends=()
optdepends=()
conflicts=()
backup=()
options=()
install=
changelog=

source=('git+https://github.com/GameFoundry/bsf.git'
        'install-dir.patch'
        'https://data.banshee3d.com/bsfCompiledData_Master_35.zip'
        'https://data.banshee3d.com/bsfData_Master_7.zip'
        'https://data.banshee3d.com/bsfDocImagesData_Master_2.zip'
        'https://data.banshee3d.com/bsfDependencies_Linux_Master_11.zip'
        'https://data.banshee3d.com/bsfDep_XShaderCompiler_Linux_Master_6.zip'
        'https://data.banshee3d.com/SemanticUI.zip')
noextract=()
validpgpkeys=()

prepare() {
	cp -r Data bsf/
	cp -r Dependencies bsf/
	cp -r Documentation bsf/
	cp -r Raw bsf/Data
	cp -r Documentation bsf/
	cp -r XShaderCompiler/ bsf/Dependencies/

	rm -rf "$_pkgname"/Dependencies/OpenAL
	rm -rf "$_pkgname"/Dependencies/libFLAC
	rm -rf "$_pkgname"/Dependencies/libICU
	rm -rf "$_pkgname"/Dependencies/libogg
	rm -rf "$_pkgname"/Dependencies/libvorbis
	rm -rf "$_pkgname"/Dependencies/freetype
	rm -rf "$_pkgname"/Dependencies/freeimg

	patch -d bsf -p1 < install-dir.patch
}

pkgver() {
	cd "$_pkgname"

	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	mkdir -p "$_pkgname"/build
	cd "$_pkgname"/build

	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_BUNDLED_LIBRARIES=OFF -G Ninja
	ninja

	cd ../Documentation/Doxygen
	doxygen native.doxyconfig
	doxygen csharp.doxyconfig
}

package_bsf-git() {
	provides=(bsf)
	conflicts=(bsf)
	depends=(libutil-linux libx11 icu libxcursor libxrandr libxi libgl openal flac libvorbis snappy freeimage freetype2)
	arch=(x86_64)

	pushd "$_pkgname"/build
	DESTDIR="$pkgdir"/ ninja install
	popd > /dev/null

	find "$pkgdir"/usr/lib -name "*.dbg" -delete

	mkdir -p "$pkgdir"/usr/share/licenses/$pkgbase
	install "$_pkgname"/LICENSE.md $pkgdir/usr/share/licenses/$pkgbase/
}

package_bsf-docs-git() {
	arch=(any)

	mkdir -p "$pkgdir"/usr/share/doc/$pkgbase
	cp -r "$_pkgname"/Documentation/Generated/native "$pkgdir"/usr/share/doc/$pkgbase/
	cp -r "$_pkgname"/Documentation/Generated/csharp "$pkgdir"/usr/share/doc/$pkgbase/

	cp -r SemanticUI "$pkgdir"/usr/share/doc/$pkgbase/native/
	cp -r SemanticUI "$pkgdir"/usr/share/doc/$pkgbase/csharp/
}

sha256sums=('SKIP'
            '9291ac8fe6c125841179ae6d3af66d20c31105a0869e8a5d30982454240a62dc'
            '848973eef189b16b00947655d2895d0195f4078159884d585653390ca781d125'
            '212ec9fd67be4f58278de6d35ea8dc6f350009cbc741202b957a8b0337da84b3'
            'e9d3793f87c4ff0a36f3574ecd070e4b6b25c567a063e3042d2dc5883636f011'
            '2c8726abb0f6ec35d00bf7d30a75a3b74de1820672db177799898d8cbb359426'
            '41ff32953fceeb1166ac1ec8ae3ab49d3a55acfa6de993d27862d80a9fbf701b'
            'd827f244a0dc9a41e012ebe165c3af2bce1da583e107635acd51012cec303121')
