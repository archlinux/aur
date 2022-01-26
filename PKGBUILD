# Set this flag to 1 if you want to hide Bismuth tray icon.
HIDE_TRAY_ICON=0

pkgname=kwin-bismuth
pkgver=2.3.0
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
_name="bismuth"
url="https://github.com/Bismuth-Forge/${_name}"
license=('MIT')
depends=('systemsettings')
makedepends=('npm' 'cmake' 'ninja' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
options=('!emptydirs')

_snapshot="${_name}-${pkgver}"
_archive="${_snapshot}.tar.gz"

source=(
    "${_archive}::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'hide-tray-icon.patch'
)

sha512sums=(
    '95995b187e04503abffec5d186c455c1fc9f6d3f997bb7c12d8bf5919b2f1d4ce4d21c9c797d9b1d92bb21ccc3eb619eebef28e8c5284522c1a13d1aaf8295ff'
    '333a495c907652bfc583a6f365acac70077fb622817a390853524f2ec21debad00841b29b3ffd88271077287182814790496b4961c90412d71eae6d1a9d6e919'
)

noextract=("${_archive}")

prepare() {
    cd "${srcdir}"

    tar xf "${_archive}" \
        "${_snapshot}/CMakeLists.txt" \
        "${_snapshot}/package.json" \
        "${_snapshot}/src" \
        "${_snapshot}/LICENSES"

    cd "${_snapshot}"

    if [ ${HIDE_TRAY_ICON} = 1 ]; then
        patch -p0 -N -i "${srcdir}/hide-tray-icon.patch"
    fi

    local ver=$(perl -ne'/"esbuild":\s*"(\S+)",?/ && print $1' <"package.json")
    rm "package.json"

    npm i -E "esbuild"@"${ver}"
}

build() {
    cd "${srcdir}/${_snapshot}"

    cmake -S "." -B "build" -G Ninja -DCMAKE_BUILD_TYPE=Release -DUSE_TSC=OFF
    cmake --build "build"
}

package() {
    cd "${srcdir}/${_snapshot}"
    DESTDIR="${pkgdir}" cmake --install "build"

    cd "LICENSES"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" && cp -rt "$_" *
}
