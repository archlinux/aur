# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: loathingkernel <loathingkernel @at gmail .dot com>
# Contributor: Adrià Cereto i Massagué <ssorgatem at gmail.com>

# This package needs reinstalled after every Proton update.

pkgname=('dxvk-mingw-proton-ge-async-git')
pkgver=1.5.r3.ga265af74
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 which allows running 3D applications on Linux using Wine. Windows DLL version)"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader')
provides=("dxvk" "d9vk" "dxvk=$pkgver")
makedepends=('ninja' 'meson>=0.43' 'glslang' 'mingw-w64-gcc' 'git' 'wine')
conflicts=('d9vk-mingw-git' 'dxvk-mingw-git' 'dxvk-mingw' 'dxvk-winelib' 'd9vk-bin' 'd9vk-winelib-git' "dxvk-bin" "dxvk-git" "dxvk-wine32-git" "dxvk-wine64-git" "dxvk-win32-git" "dxvk-win64-git" "dxvk-winelib-git")
options=(!strip staticlibs)
source=("git+https://github.com/doitsujin/dxvk.git"
	"dxvk-async.patch"
        "extraopts.patch")
sha256sums=("SKIP"
	    "SKIP"
            "SKIP")
install=$pkgname.install

pkgver() {
    cd dxvk
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd dxvk

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/extraopts.patch
    local dxvk_cflags="$CFLAGS"
    local dxvk_ldflags="$LDFLAGS"
    # Filter known bad flags before applying optimizations
    # If using -march=native and the CPU supports AVX, launching a d3d9
    # game can cause an Unhandled exception. The cause seems to be the
    # combination of AVX instructions and tree vectorization (implied by O3),
    # all tested archictures from sandybridge to haswell are affected.
    # Disabling AVX (and AVX2 as a side-effect).
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516                                               
    dxvk_cflags+=" -mno-avx"                                                                      
    # Filter fstack-protector{ ,-all,-strong} flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476                                            
    #dxvk_cflags+=" -fno-stack-protector"
    dxvk_cflags="${dxvk_cflags// -fstack-protector*([\-all|\-strong])/}"                          
    # Adjust optimization level in meson arguments. This is ignored
    # anyway because meson sets its own optimization level.
    dxvk_cflags="${dxvk_cflags// -O+([0-3s]|fast)/}"                                              
    # Doesn't compile with these flags in MingW so remove them.
    # They are also filtered in Wine PKGBUILDs so remove them
    # for winelib versions too.                                                                   
    dxvk_cflags="${dxvk_cflags/ -fno-plt/}"
    dxvk_ldflags="${dxvk_ldflags/,-z,now/}"
    dxvk_ldflags="${dxvk_ldflags/,-z,relro/}"                                                     
    sed -i build-win64.txt \
	-e "s|@CARGS@|\'${dxvk_cflags// /\',\'}\'|g" \
	-e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"                                            
    sed -i build-win32.txt \
	-e "s|@CARGS@|\'${dxvk_cflags// /\',\'}\'|g" \
	-e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"                                                                                              
    # Uncomment to enable dxvk async patch.
    # Enable at your own risk. If you don't know what it is,                                    
    # and its implications, leave it as is. You have been warned.                               
    # I am not liable if anything happens to you by using it.                                   
    # Patch enables async by default. YOU HAVE BEEN WARNED.
    patch -p1 -i "$srcdir"/dxvk-async.patch                                                     
}                                     

build() {
    meson dxvk "build/x64" \
        --cross-file dxvk/build-win64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -D enable_tests=false
    ninja -C "build/x64"

    meson dxvk "build/x32" \
        --cross-file dxvk/build-win32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -D enable_tests=false
    ninja -C "build/x32"
}

package_dxvk-mingw-proton-ge-async-git() {
        arch=('x86_64')
        conflicts=("dxvk-bin")
        DESTDIR="$pkgdir" ninja -C "build/x32" install
        DESTDIR="$pkgdir" ninja -C "build/x64" install
        install -Dm 644 dxvk/setup_dxvk.sh "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
        mkdir -p "$pkgdir/usr/bin"
        ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
        chmod +x "$pkgdir/usr/share/dxvk/setup_dxvk.sh"

        mkdir -p ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom/dist/lib/wine/dxvk/
	mkdir -p ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom-stable/dist/lib/wine/dxvk/
	mkdir -p ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom-legacy/dist/lib/wine/dxvk/

	mkdir -p ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom/dist/lib64/wine/dxvk/
	mkdir -p ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom-stable/dist/lib64/wine/dxvk/
	mkdir -p ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom-legacy/dist/lib64/wine/dxvk/

	cp -r ${pkgdir}/usr/share/dxvk/x32/* ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom/dist/lib/wine/dxvk/
	cp -r ${pkgdir}/usr/share/dxvk/x32/* ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom-stable/dist/lib/wine/dxvk/
	cp -r ${pkgdir}/usr/share/dxvk/x32/* ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom-legacy/dist/lib/wine/dxvk/

	cp -r ${pkgdir}/usr/share/dxvk/x64/* ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom/dist/lib64/wine/dxvk/
	cp -r ${pkgdir}/usr/share/dxvk/x64/* ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom-stable/dist/lib64/wine/dxvk/
	cp -r ${pkgdir}/usr/share/dxvk/x64/* ${pkgdir}/usr/share/steam/compatibilitytools.d/proton-ge-custom-legacy/dist/lib64/wine/dxvk/
}
