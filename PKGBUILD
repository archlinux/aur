_name=bismuth
pkgname=kwin-${_name}
pkgver=3.1.4
pkgrel=5
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Bismuth-Forge/${_name}"
license=('MIT')
depends=('systemsettings')
makedepends=('cmake' 'npm' 'extra-cmake-modules' 'kcoreaddons5' 'kconfig5' 'ki18n5' 'kcmutils5' 'kdeclarative5')
options=('!emptydirs')

_snapshot="${_name}-${pkgver}"
source=(
    "${_snapshot}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    '01-no-git.patch'
    "01-wayland-fix.patch::${url}/pull/490/commits/ce377a33232b7eac80e7d99cb795962a057643ae.patch"
)
sha256sums=(
    '216d8f5a6c649e4950989b2d7e100fe23832311328b970b8e32985c1ef25b0b5'
    '7209a88111a8cac5afd4aee64be760f76d9e0b56846142e3656101f065751120'
    '058ade45a6099fb11ab1b55f79f304a463a274ef3c8557dcc5c09cb0488fdc10'
)

prepare() {
    for p in *.patch; do
        patch -p1 -d "${_snapshot}" < "${p}"
    done

    local ver
    ver="$(sed -En 's/.*"esbuild": "(.+)".*/\1/p' "${_snapshot}/package.json")"
    test -n "${ver}"
    npm i -E --ignore-scripts --prefix=. --include=optional "esbuild@${ver}"
}

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_PROJECT_VERSION="${pkgver}" \
        -DUSE_TSC=OFF \
        -DBUILD_TESTING=OFF

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/LICENSES/"*
}
