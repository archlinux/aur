# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-git
pkgver=20180327.873deed
pkgrel=1
epoch=
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine."
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
groups=()
depends=('vulkan-icd-loader' 'wine>=3.4')
makedepends=('ninja' 'meson' 'glslang' 'mingw-w64-gcc')
checkdepends=()
provides=("dxvk")
conflicts=("dxvk-bin")
replaces=()
backup=()
options=(!strip !buildflags staticlibs)
install=
changelog=
source=($pkgname::"git+https://github.com/doitsujin/dxvk.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()


pkgver() {
        cd "$pkgname"
        git log -1 --format=%cd.%h --date=short|tr -d -
}


build() {
	"$pkgname"/package-release.sh $pkgver $PWD --no-package
}



package() {
	mkdir -p "$pkgdir/usr/share/dxvk"
	cp -rv dxvk-$pkgver/* "$pkgdir/usr/share/dxvk"
	if [ ! -f "$pkgdir"/usr/share/dxvk/x64/d3d11.dll ] ||\
	 [ ! -f "$pkgdir"/usr/share/dxvk/x64/dxgi.dll ] ||\
	 [ ! -f "$pkgdir"/usr/share/dxvk/x32/d3d11.dll ] ||\
	 [ ! -f "$pkgdir"/usr/share/dxvk/x32/dxgi.dll ]; then
		echo "Missing files, build was unsuccessful"
		return 1
	fi
        mkdir -p "$pkgdir/usr/bin"
        ln -s "/usr/share/dxvk/x32/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk32"
        ln -s "/usr/share/dxvk/x64/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk64"
}
