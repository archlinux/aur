pkgname=kwin-bismuth
pkgver=3.1.1
pkgrel=2
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
_repo='bismuth'
url="https://github.com/Bismuth-Forge/${_repo}"
license=('MIT')
depends=('systemsettings')
makedepends=('npm' 'cmake' 'ninja' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
options=('!emptydirs')

_snapshot="${_repo}-${pkgver}"

source=(
    "${_snapshot}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "kwin-5.25-fix.patch::https://github.com/benemorius/bismuth/commit/b43651f223b40dace4265058d96507bf8c7b0807.patch"
)

sha256sums=(
    '5e589df26f27fefa1da34221b80b1d352c74a45373bfa1792866cf4587b921c8'
    '1ca867db2207b36ade344d4292a9c3ec760420f6cfb5dd173a3cf43ce5187713'
)

prepare() {
    cd "${srcdir}"
    local ver=$(perl -ne'/"esbuild":\s*"(\S+)",?/ && print $1' <"${_snapshot}/package.json")
    npm i -E --ignore-scripts=true "esbuild"@"${ver}"

    cd "${_snapshot}"
    patch -p1 -i "${srcdir}/${source[1]%::*}"
}

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_TSC=OFF \
        -DBUILD_TESTING=false

    ninja -C "build"
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}" ninja -C "build" install

    cd "${_snapshot}/LICENSES"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" && cp -rt "$_" *
}
