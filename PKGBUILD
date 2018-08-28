# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=dxvk-wine-git
pkgname=('dxvk-wine64-git' 'dxvk-wine32-git')
pkgver=0.70_21_g715d257
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 10/11 which allows running 3D applications on Linux using Wine. Winelib version"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=3.14' 'winetricks')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'wine')
source=(dxvk-src::"git+https://github.com/doitsujin/dxvk.git" 
    setup_dxvk_aur.verb
    )
sha256sums=("SKIP" "b441fc757176718b2601aab73987fb103ddd7cd4a4c3587de1e88d73e762be6b")

pkgver() {
        cd dxvk-src
        git describe | sed s/"-"/"_"/g | sed 's/^v\(.*\)/\1/'
}


build() {
        cd dxvk-src
        rm -rf "$pkgbase/build.wine??"
	meson --cross-file build-wine64.txt \
            --buildtype "release"\
            --prefix "$PWD/../build64"\
            --strip\
            -Denable_tests=false\
            "$pkgbase/build.wine64"
        cd "$pkgbase/build.wine64"
        ninja install
        cd "../.."
	meson --cross-file build-wine32.txt \
            --buildtype "release"\
            --prefix "$PWD/../build32"\
            --strip\
            -Denable_tests=false\
            "$pkgbase/build.wine32"
        cd "$pkgbase/build.wine32"
        ninja install
}

_package_dxvk() {
        if [ "$1" = "32" ]; then
            _destdir="/usr/lib32/dxvk/"
        else
            _destdir="/usr/lib/dxvk/"
        fi
        mkdir -p "$pkgdir/$_destdir"
	cp -v build$1/*/* "$pkgdir/$_destdir"
	extension=".dll.so"
	for libname in "d3d11" "dxgi" "d3d10" "d3d10_1" "d3d10core"; do
            if [ ! -f "$pkgdir"/$_destdir/$libname$extension ] ; then
                    echo "Missing file: $libname$extension, build was unsuccessful"
                    return 1
            fi
        done
        mkdir -p "$pkgdir/usr/bin"
        cat setup_dxvk_aur.verb | sed s/"DXVK_ARCH=64"/"DXVK_ARCH=$1"/g > "$pkgdir/$_destdir/setup_dxvk_aur.verb"
	echo "winetricks --force $_destdir/setup_dxvk_aur.verb" > "$pkgdir/usr/bin/setup_dxvk$1"
	chmod +x "$pkgdir/usr/bin/setup_dxvk$1"
}

package_dxvk-wine64-git() {
        arch=('x86_64')
        conflicts=("dxvk-win64-bin" "dxvk-win64-git" "dxvk-git" "dxvk-bin")
        provides=("dxvk" "dxvk64")
        optdepends=('dxvk32: 32-bit support')
        _package_dxvk 64
}

package_dxvk-wine32-git() {
        arch=('i686' 'x86_64')
        conflicts=("dxvk-win32-bin" "dxvk-win32-git" "dxvk-git" "dxvk-bin")
        depends=('lib32-vulkan-icd-loader' 'wine>=3.14' 'winetricks')
        optdepends=('dxvk64: 64-bit support')
        provides=("dxvk" "dxvk32")
        _package_dxvk 32
}
