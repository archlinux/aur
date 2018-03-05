# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-git
_srcname=dxvk
pkgver=20180305.5f3bfde
pkgrel=1
epoch=
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine. Requires Wine with Vulkan support (wine-vulkan)"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
groups=()
depends=('vulkan-icd-loader' 'wine')
makedepends=('ninja' 'meson' 'glslang' 'mingw-w64-gcc')
checkdepends=()
optdepends=('wine-vulkan-git: Wine with Vulkan support' 'wine-staging-vulkan-git: Wine with Vulkan support')
provides=("dxvk")
conflicts=("dxvk-bin")
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
	if [ -d "build.w64" ]; then rm -rf build.w64; fi
	meson --cross-file build-win64.txt build.w64
	cd build.w64
        meson configure -Dbuildtype=release
        ninja
	cd ..
	if [ -d "build.w32" ]; then rm -rf build.w32; fi
	meson --cross-file build-win32.txt build.w32
	cd build.w32
	meson configure -Dbuildtype=release
	ninja
}



package() {
        #Workaround meson bug that ignores prefix...
        mkdir -p "$pkgdir/usr/share/dxvk/x64"
	mkdir -p "$pkgdir/usr/share/dxvk/x32"
	cd "$_srcname"/build.w64
	DESTDIR="$pkgdir/" ninja install
	mv "$pkgdir/usr/local/"* "$pkgdir/usr/share/dxvk/x64"
        cd ../build.w32
        DESTDIR="$pkgdir/" ninja install
        mv "$pkgdir/usr/local/"* "$pkgdir/usr/share/dxvk/x32"
        mkdir -p "$pkgdir/usr/bin"
        ln -s "/usr/share/dxvk/x32/bin/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk32"
        ln -s "/usr/share/dxvk/x64/bin/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk64"
}
