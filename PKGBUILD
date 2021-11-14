# Set this flag to 1 if you want to hide Bismuth tray icon.
HIDE_TRAY_ICON=0

pkgname=kwin-bismuth-git
pkgver=2.1.0.r9.gb049197
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
    '9c3a1a9567fd9bbd56afd82413a8470591192a8dff872c8e71145bfab41c0ffc8c3e22c5975c35f3c88d112850f12ef4ab1596a59306ceb5c070394f05cf2cd1'
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
