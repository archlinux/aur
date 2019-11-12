# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-native-git
pkgver=4.11.8.r1.fd5b6b2
_geckover=2.47
_monover=4.9.4
pkgrel=1
pkgdesc="Compatibility tool for Steam Play based on Wine and additional components. Monolithic distribution"
arch=(x86_64)
url="https://github.com/ValveSoftware/Proton"
license=('GPL')
groups=()
depends=(
    python
    steam-native-runtime
    sdl2
    wine_gecko=$_geckover
    wine-mono-bin=$_monover
    vkd3d       lib32-vkd3d
    dxvk
    d9vk
)
makedepends=(
    git
    cmake
    afdko
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=()
options=()
source=(
    proton::git+https://github.com/ValveSoftware/Proton.git
    wine-valve::git+https://github.com/ValveSoftware/wine.git
    ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git
    openvr::git+https://github.com/ValveSoftware/openvr.git
    liberation-fonts::git+https://github.com/liberationfonts/liberation-fonts.git
    FAudio::git+https://github.com/FNA-XNA/FAudio.git
    proton-unfuck_makefile.patch
    proton-disable_lock.patch
)
sha256sums=(
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP #7e0231e4edab976d3cb48e1c74c08c3825b7a7d71f077987742e1f6987540b07
    SKIP #f9ea33b2658e4cf3f2d0fc1289b1688162b2169cba0b65cfe80e0bb1d638054f
)

pkgver() {
	cd proton
	printf "%s" "$(git describe --long --tags | sed 's/^proton-//; s/\([^-]*-\)g/r\1/; s/-/./g')"
}

prepare() {
    [ ! -d build ] && mkdir build

    cd proton
    for submodule in ffmpeg openvr FAudio fonts/liberation-fonts; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"
        git submodule update "${submodule}"
    done

    for submodule in wine; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"-valve
        git submodule update "${submodule}"
    done

    patch -p1 -i "$srcdir"/proton-unfuck_makefile.patch
    patch -p1 -i "$srcdir"/proton-disable_lock.patch
}

build() {
	cd build
    ../proton/configure.sh \
        --no-steam-runtime \
        --with-ffmpeg \
        --build-name="${pkgname%-git}"

    export CFLAGS="${CFLAGS/-O3/-O2}"
    export CFLAGS="${CFLAGS/ -fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"

    SUBMAKE_JOBS="${MAKEFLAGS/-j/}" \
        WINEESYNC=0 \
        WINEFSYNC=0 \
        NO_DXVK=1 \
        SYSTEM_GECKO=1 \
        SYSTEM_MONO=1 \
        make -j1 dist
}

package() {
    cd build

    mkdir -p "$pkgdir/usr/share/steam/compatibilitytools.d"
    mv dist "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"

    find "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}" -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/{proton,dist/bin/{wine{,64},wine{,64}-preloader,wineserver}}

    ln -s /usr/share/wine/mono "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/share/wine/mono
    ln -s /usr/share/wine/gecko "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/share/wine/gecko

    for i in d3d10_1.dll d3d10core.dll d3d10.dll d3d11.dll dxgi.dll
    do
        ln -s "/usr/share/dxvk/x32/$i" \
            "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/lib/wine/dxvk/
        ln -s "/usr/share/dxvk/x64/$i" \
            "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/lib64/wine/dxvk/
    done

    for i in d3d9.dll
    do 
        ln -s "/usr/share/d9vk/x32/$i" \
            "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/lib/wine/dxvk/
        ln -s "/usr/share/d9vk/x64/$i" \
            "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/lib64/wine/dxvk/
    done
}
