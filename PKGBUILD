# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=(bsf-git bsf-git-docs)
pkgbase=bsf
_pkgname=bsf
pkgver=r4575.54f5a3abc
pkgrel=1
epoch=
pkgdesc="A C++ library that aims to provide a unified foundation for the development of real-time graphical applications, whether games, engines or tools"
arch=(x86_64)
url="https://www.bsframework.io/"
license=('MIT')
groups=()
depends=(libutil-linux libx11 icu libxcursor libxrandr libxi libgl openal flac libvorbis snappy freeimage freetype2)
makedepends=(git cmake doxygen ninja)
checkdepends=()
optdepends=()
provides=(bsf)
conflicts=(bsf)
replaces=()
backup=()
options=()
install=
changelog=

# source=("git+https://github.com/GameFoundry/bsf.git"
source=("git+https://github.com/Meumeu/bsf.git#branch=build-system-cleanup"
        "install-dir.patch"
        "https://data.banshee3d.com/bsfCompiledData_Master_5.zip"
        "https://data.banshee3d.com/bsfData_Master_6.zip"
        "https://data.banshee3d.com/bsfDependencies_Linux_Master_8.zip")
noextract=()
sha256sums=('SKIP'
            '3ebcebdbe4d5bad832a47109b09f6d9bcd3e02b7a0bb9be2301c8bd630ed706b'
            '49b419403f4f85e189832f3b89c78c037e7b531541bb67b130764f33c7306224'
            '3b5e087e200e786ab1a0b79d6f3cd04d4c70fde9337dc8082a13479f477d1025'
            '60c53790eda57495fefdad2bcc4a6a78198a330e70aeec71abc213edcc8b7036')
validpgpkeys=()

prepare() {
	cp -r Data bsf/
	cp -r Dependencies bsf/
	cp -r Raw bsf/Data

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
	doxygen config.doxyconfig
}

package_bsf-git() {
	pushd "$_pkgname"/build
	DESTDIR="$pkgdir"/ ninja install
	popd > /dev/null

	find "$pkgdir"/usr/lib -name "*.dbg" -delete

	mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
	install "$_pkgname"/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/
}

package_bsf-git-docs() {
	depends=()
	arch=(any)

	mkdir -p "$pkgdir"/usr/share/doc/$pkgbase
	cp -r "$_pkgname"/Documentation/Generated/html/* "$pkgdir"/usr/share/doc/$pkgbase/
}
