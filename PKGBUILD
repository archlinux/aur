pkgname=kwin-bismuth
pkgver=3.1.0
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
_repo='bismuth'
url="https://github.com/Bismuth-Forge/${_repo}"
license=('MIT')
depends=('systemsettings')
makedepends=('npm' 'cmake' 'ninja' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
options=('!emptydirs')

_snapshot="${_repo}-${pkgver}"

source=("${_snapshot}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('95b9b02bb549af6efbd36100d8518e90e99f1ad3810335b30a925067bc212861')

prepare() {
    cd "${srcdir}"
    local ver=$(perl -ne'/"esbuild":\s*"(\S+)",?/ && print $1' <"${_snapshot}/package.json")
    npm i -E --ignore-scripts=true "esbuild"@"${ver}"
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
