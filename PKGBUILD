# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-git
_srcname=dxvk
pkgver=20180214.0c2058e
pkgrel=1
epoch=
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine."
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
groups=()
depends=('vulkan-icd-loader' 'wine-staging')
makedepends=('ninja' 'meson' 'glslang' 'mingw-w64-gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !buildflags staticlibs)
install=
changelog=
source=("git+https://github.com/doitsujin/dxvk.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()


pkgver() {
        cd "$_srcname"
        git log -1 --format=%cd.%h --date=short|tr -d -
}


build() {
	cd "$_srcname"
	if [ -d "build.w64" ]; then rm -r build.w64; fi
	meson --cross-file build-win64.txt build.w64
	cd build.w64
        meson configure -Dprefix=/opt/dxvk.w64 -Dbuildtype=release
        ninja
	cd ..
	if [ -d "build.w32" ]; then rm -r build.w32; fi
	meson --cross-file build-win32.txt build.w32
	cd build.w32
	meson configure -Dprefix=/opt/dxvk.w32 -Dbuildtype=release
	ninja
}



package() {
	cd "$_srcname"/build.w64
	DESTDIR="$pkgdir/" ninja install
	mkdir -p "$pkgdir/usr/local/bin"
	ln -s "/opt/dxvk.w64/bin/setup_dxvk.sh" "$pkgdir/usr/local/bin/setup_dxvk64"
        cd ../build.w32
        DESTDIR="$pkgdir/" ninja install
        ln -s "/opt/dxvk.w32/bin/setup_dxvk.sh" "$pkgdir/usr/local/bin/setup_dxvk32"
}
