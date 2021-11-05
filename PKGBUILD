# Set this flag to 1 if you want to hide Bismuth tray icon.
HIDE_TRAY_ICON=0

pkgname=kwin-bismuth-git
pkgver=v2.0.0.r3.gbf4da30
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
url="https://github.com/Bismuth-Forge/bismuth"
license=('MIT')
depends=('systemsettings')
makedepends=('npm' 'cmake' 'ninja' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
provides=("bismuth" "kwin-bismuth")
conflicts=('bismuth')
options=('!strip')

source=(
    "bismuth::git+${url}"
    'hide-tray-icon.patch'
    'build.sh.patch'
)

sha512sums=(
    'SKIP'
    '333a495c907652bfc583a6f365acac70077fb622817a390853524f2ec21debad00841b29b3ffd88271077287182814790496b4961c90412d71eae6d1a9d6e919'
    '24f2b96f3384fa684acbdc417323957d0eae1f55f2df096992f14eac11c5b2799aa9990870ea27a3c22478b55554929cc3bb118c3790e5939afeeb00a670a72a'
)

pkgver() {
    cd "./bismuth"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "./bismuth"

    patch -p0 -N -i "${srcdir}/build.sh.patch"

    if [ ${HIDE_TRAY_ICON} = 1 ]; then
        patch -p0 -N -i "${srcdir}/hide-tray-icon.patch"
    fi

    npm run clean >/dev/null

    npm i -P --production esbuild@'^0.12.26'

    npm run build
}

package() {
    cd "${srcdir}/bismuth"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/" && cp -r "./LICENSES/"* "$_"

    mkdir -p "${pkgdir}/usr/share/kwin/scripts/bismuth/" && cp -r "./build/kwinscript/"* "$_"

    DESTDIR="${pkgdir}" cmake --install "./build/kcm"
}
