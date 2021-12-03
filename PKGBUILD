# Set this flag to 1 if you want to hide Bismuth tray icon.
HIDE_TRAY_ICON=0

pkgname=kwin-bismuth
pkgver=2.1.0
pkgrel=3
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
    'script-cmake.patch'
)

sha512sums=(
    '9e689646eeb5a879e080faeca0a6df7f5699d6ef312a5b39bd9607628f4d11d1b06a8893b9a8db32ae239d6174770c8356a3cb019bfd481b0a464e74f094ed10'
    '333a495c907652bfc583a6f365acac70077fb622817a390853524f2ec21debad00841b29b3ffd88271077287182814790496b4961c90412d71eae6d1a9d6e919'
    'b1beed3c17d9b66c2cb887dd475177534d7519389a120cf2718f295daa78634a6459e28580d6a63f2519b3861391ad8e03615040af00bd2151db2cd08d194f32'
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

    patch -p0 -N -i "${srcdir}/script-cmake.patch"

    if [ ${HIDE_TRAY_ICON} = 1 ]; then
        patch -p0 -N -i "${srcdir}/hide-tray-icon.patch"
    fi

    local ver=$(perl -ne'/"esbuild":\s*"(\S+)",?/ && print $1' <"package.json")
    rm "package.json"

    npm i -E --package-lock=false "esbuild"@"${ver}"
}

build() {
    cd "${srcdir}/${_snapshot}"

    cmake -S "." -B "build" -G Ninja -DCMAKE_BUILD_TYPE=MinSizeRel
    cmake --build "build"
}

package() {
    cd "${srcdir}/${_snapshot}"

    DESTDIR="${pkgdir}" cmake --install "build"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/" && cp -rt "$_" "./LICENSES/"*
}
