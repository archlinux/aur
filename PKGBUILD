pkgname=kwin-bismuth
pkgver=3.1.1
pkgrel=3
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
    "kwin-5.25-hotfix.patch::${url}/pull/377.patch"
)

sha256sums=(
    '5e589df26f27fefa1da34221b80b1d352c74a45373bfa1792866cf4587b921c8'
    '0fcb79f1ab17e786086f081c2588b74a51e6d3fb1859432c3a0d9d3d95a8f43e'
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
