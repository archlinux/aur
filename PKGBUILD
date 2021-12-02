# Set this flag to 1 if you want to hide Bismuth tray icon.
HIDE_TRAY_ICON=0

pkgname=kwin-bismuth-git
pkgver=2.1.0.r27.g84a0ac5
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
url="https://github.com/Bismuth-Forge/bismuth"
license=('MIT')
depends=('systemsettings')
makedepends=('git' 'npm' 'cmake' 'ninja' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
provides=("bismuth" "kwin-bismuth")
conflicts=('bismuth')
options=('!emptydirs')

source=('hide-tray-icon.patch')
sha512sums=('333a495c907652bfc583a6f365acac70077fb622817a390853524f2ec21debad00841b29b3ffd88271077287182814790496b4961c90412d71eae6d1a9d6e919')

pkgver() {
    cd "${srcdir}/repo"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"

    if [ ! -d "repo" ]; then
        git clone --filter=tree:0 --sparse --no-checkout "${url}" "repo"
    fi

    cd "repo"

    git pull
    git sparse-checkout set "/package.json" "/CMakeLists.txt" "/src" "/LICENSES"
    git checkout -f "master"
}

build() {
    cd "${srcdir}/repo"

    npm i --omit=dev -P "esbuild"

    if [ ${HIDE_TRAY_ICON} = 1 ]; then
        patch -p0 -N -i "${srcdir}/hide-tray-icon.patch"
    fi

    cmake -S "." -B "build" -G Ninja -DCMAKE_BUILD_TYPE=MinSizeRel -DUSE_TSC=OFF
    cmake --build "build"
}

package() {
    cd "${srcdir}/repo"

    DESTDIR="${pkgdir}" cmake --install "build"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/" && cp -r "./LICENSES/"* "$_"
}
