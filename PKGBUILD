# Set this flag to 1 if you want to hide Bismuth tray icon.
HIDE_TRAY_ICON=0

pkgname=kwin-bismuth-git
pkgver=2.1.0.r5.g9996263
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
url="https://github.com/Bismuth-Forge/bismuth"
license=('MIT')
depends=('systemsettings')
makedepends=('npm' 'cmake' 'ninja' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
provides=("bismuth" "kwin-bismuth")
conflicts=('bismuth')
options=('!emptydirs')

source=(
    "bismuth::git+${url}"
    'hide-tray-icon.patch'
    'script-cmake.patch'
)

sha512sums=(
    'SKIP'
    '333a495c907652bfc583a6f365acac70077fb622817a390853524f2ec21debad00841b29b3ffd88271077287182814790496b4961c90412d71eae6d1a9d6e919'
    '95ca9c3826d12ae57f1c061ee23473891e544513ebe4e287d8088fe7e4f3f27e7f6643bbe7d49284becb546b3662e1cb5d2e9d730ddf2ab03cf29c54ab5c4083'
)

pkgver() {
    cd "${srcdir}/bismuth"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/bismuth"

    patch -p0 -N -i "${srcdir}/script-cmake.patch"

    if [ ${HIDE_TRAY_ICON} = 1 ]; then
        patch -p0 -N -i "${srcdir}/hide-tray-icon.patch"
    fi

    npm i --omit=dev -P esbuild@'^0.12.26'
    npm run build
}

package() {
    cd "${srcdir}/bismuth"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/" && cp -r "./LICENSES/"* "$_"

    DESTDIR="${pkgdir}" cmake --install "build"
}
