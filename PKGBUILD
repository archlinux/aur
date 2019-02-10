# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=(bsf-git bsf-git-docs)
pkgbase=bsf-git
_pkgname=bsf
pkgver=r4728.5b9720f5b
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
        'dont-strip-symbols.patch'
        'https://data.banshee3d.com/bsfCompiledData_Master_13.zip'
        'https://data.banshee3d.com/bsfData_Master_6.zip'
        'https://data.banshee3d.com/bsfDocImagesData_Master_2.zip'
        'https://data.banshee3d.com/bsfDependencies_Linux_Master_9.zip'
        'https://data.banshee3d.com/bsfDep_XShaderCompiler_Linux_Master_1.zip')
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
	patch -d bsf -p1 < dont-strip-symbols.patch
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
	doxygen config.doxyconfig
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

package_bsf-git-docs() {
	arch=(any)

	mkdir -p "$pkgdir"/usr/share/doc/$pkgbase
	cp -r "$_pkgname"/Documentation/Generated/html/* "$pkgdir"/usr/share/doc/$pkgbase/
}

sha256sums=('SKIP'
            '4301910bd0c17e2747c08b27617fe3b4e5f10f70a78ffb29dcef4f23d52b4e16'
            '871c19f0e652efa2cbdaef34b6960ba9a81378b957cdf3701dc3f8733cb69cd6'
            '100e91e5ae58dd301adc0d5f31c972237a688f12682e0c0f21e200430728bf27'
            '3b5e087e200e786ab1a0b79d6f3cd04d4c70fde9337dc8082a13479f477d1025'
            'e9d3793f87c4ff0a36f3574ecd070e4b6b25c567a063e3042d2dc5883636f011'
            '300541083a4c27da9825cddaaca98dabb49175c84845ce40a45a0faaeeb23d4d'
            '3e9063abfb04ae88cf0275d90783d37b87c3c84d2e2bea9a163b65641aa07d66')
