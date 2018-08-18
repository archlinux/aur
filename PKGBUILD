# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=dxvk-git
pkgname=('dxvk-win64-git' 'dxvk-win32-git' 'dxvk-git')
pkgver=0.65_42_g861165f
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 10/11 which allows running 3D applications on Linux using Wine."
arch=('x86_64' 'i686')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'mingw-w64-gcc' 'git' 'wine')
options=(!strip !buildflags staticlibs)
source=($pkgbase::"git+https://github.com/doitsujin/dxvk.git"
    "setup_dxvk_aur.verb"
)
sha256sums=("SKIP" "1a88e01e02ef9bfd9bf43d8dec4e70b425fb25812f597463ee4145705c82a504")


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
	extension=".dll"
	for libname in "d3d11" "dxgi" "d3d10" "d3d10_1" "d3d10core"; do
            if [ ! -f "$pkgdir"/$destdir/x$1/$libname$extension ] ; then
                    echo "Missing file: $libname$extension, build was unsuccessful"
                    return 1
            fi
        done
        mkdir -p "$pkgdir/usr/bin"
        cat setup_dxvk_aur.verb | sed s/"DXVK_ARCH=64"/"DXVK_ARCH=$1"/g > "$pkgdir/$destdir/x$1/setup_dxvk_aur.verb"
	echo "winetricks --force $destdir/x$1/setup_dxvk_aur.verb" > "$pkgdir/usr/bin/setup_dxvk$1"
	chmod +x "$pkgdir/usr/bin/setup_dxvk$1"
}

package_dxvk-win64-git() {
        arch=('x86_64')
        conflicts=("dxvk-win64-bin")
        provides=("dxvk" "dxvk64")
        depends=('vulkan-icd-loader' 'wine>=3.10' 'winetricks')
        conflicts=("dxvk-git<$pkgver")
        replaces=("dxvk-git")
        _package_dxvk 64
}
package_dxvk-win32-git() {
        arch=('i686' 'x86_64')
        conflicts=("dxvk-win32-bin")
        provides=("dxvk" "dxvk32")
        depends=('lib32-vulkan-icd-loader' 'wine>=3.10' 'winetricks')
        conflicts=("dxvk-git<$pkgver")
        replaces=("dxvk-git")
        _package_dxvk 32
}
package_dxvk-git() {
	pkgdesc="Dummy package to smooth the transition to the split packages"
	depends=("dxvk-win32-git" "dxvk-win64-git")
}
