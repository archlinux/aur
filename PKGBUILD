_name=bismuth
_base=kwin-${_name}
pkgname=${_base}-git
pkgver=3.1.4.r3.gef69afe
pkgrel=3
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Bismuth-Forge/${_name}"
license=('MIT')
depends=('systemsettings')
makedepends=('git' 'cmake' 'npm' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
provides=("${_base}")
conflicts=("${_base}")
options=('!emptydirs')

source=("${_name}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    local ver
    ver="$(sed -En 's/.*"esbuild": "(.+)".*/\1/p' "${_name}/package.json")"
    test -n "${ver}"
    npm i -E --ignore-scripts --prefix=. --include=optional "esbuild@${ver}"
}

build() {
    cmake -B "build" -S "${_name}" \
        -DUSE_TSC=OFF \
        -DBUILD_TESTING=OFF

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_name}/LICENSES/"*
}
