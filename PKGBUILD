# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=(bsf-git bsf-git-docs)
pkgbase=bsf-git
_pkgname=bsf
pkgver=r4633.20d4e5373
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
        'https://data.banshee3d.com/bsfCompiledData_Master_8.zip'
        'https://data.banshee3d.com/bsfData_Master_6.zip'
        'https://data.banshee3d.com/bsfDocImagesData_Master_2.zip'
        'https://data.banshee3d.com/bsfDependencies_Linux_Master_8.zip')
noextract=()
sha256sums=('SKIP'
            'ee326f6eb0a97e7b306181a34675b5fadf55ce69bdec1c738600bb9d15908e91'
            '871c19f0e652efa2cbdaef34b6960ba9a81378b957cdf3701dc3f8733cb69cd6'
            '2701d9d01a7346dc7eb2c83bc8a46099e524c7cb2e7b9e19fe0fb914c0af1fb8'
            '3b5e087e200e786ab1a0b79d6f3cd04d4c70fde9337dc8082a13479f477d1025'
            'e9d3793f87c4ff0a36f3574ecd070e4b6b25c567a063e3042d2dc5883636f011'
            '60c53790eda57495fefdad2bcc4a6a78198a330e70aeec71abc213edcc8b7036')
validpgpkeys=()

prepare() {
	cp -r Data bsf/
	cp -r Dependencies bsf/
	cp -r Documentation bsf/
	cp -r Raw bsf/Data
	cp -r Documentation bsf/

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
