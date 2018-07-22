# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=dxvk-git
pkgname=('dxvk-win64-git' 'dxvk-win32-git')
pkgver=0.63
pkgrel=2
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine."
arch=('x86_64' 'i686')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=3.10')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'mingw-w64-gcc' 'git' 'wine')
options=(!strip !buildflags staticlibs)
source=($pkgbase::"git+https://github.com/doitsujin/dxvk.git")
md5sums=("SKIP")


pkgver() {
        cd "$pkgbase"
        git describe | sed s/"-"/"_"/g | sed 's/^v\(.*\)/\1/'
}


build() {
	"$pkgbase"/package-release.sh $pkgver $PWD --no-package
}

_package_dxvk() {
        destdir="/usr/share/dxvk/"
	mkdir -p "$pkgdir/$destdir"
	cp -rv dxvk-$pkgver/x$1 "$pkgdir/$destdir"
	if [ ! -f "$pkgdir"/$destdir/x$1/d3d11.dll ] ||\
	 [ ! -f "$pkgdir"/$destdir/x$1/dxgi.dll ]; then
		echo "Missing files, build was unsuccessful"
		return 1
	fi
        mkdir -p "$pkgdir/usr/bin"
        ln -s "$destdir/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk$1"
}

package_dxvk-win64-git() {
        arch=('x86_64')
        conflicts=("dxvk-win64-bin")
        provides=("dxvk" "dxvk64")
        conflicts=("dxvk-git")
        replaces=("dxvk-git")
        _package_dxvk 64
}
package_dxvk-win32-git() {
        arch=('i686' 'x86_64')
        conflicts=("dxvk-win32-bin")
        provides=("dxvk" "dxvk32")
        conflicts=("dxvk-git")
        replaces=("dxvk-git")
        _package_dxvk 32
}
