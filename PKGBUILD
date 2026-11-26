# KWin Snow effect — packaged from the tagged GitHub release (vX.Y.Z).
#
# KWin has no stable out-of-tree ABI for native effects: this package is
# built against the host kwin headers and must be rebuilt whenever Arch
# updates KWin (bump pkgrel or let an AUR submission track upstream tags).
#
# The upstream CMake project() still hard-codes VERSION 0.2.0, so the
# release tag is injected via -DSNOW_PACKAGE_VERSION below.
#
# v0.3.2 predates KWin 6.8, where the paint* virtuals (and the
# EffectHandler pass-throughs) return bool instead of void. The effect
# must match the base class signature and propagate a failed paint, so
# the patch below adds a return-type guard, applied in prepare(). Drop
# the patch once upstream ships a release built for KWin 6.8.

pkgname=kwin-effect-snow
pkgver=0.3.2
pkgrel=1
pkgdesc='Native KWin effect that renders falling snow on windows and panels'
arch=('x86_64')
url='https://github.com/joepadmiraal/kwin-snow'
license=('GPL-2.0-or-later')
depends=('kwin' 'qt6-base' 'kconfig' 'kcoreaddons' 'ki18n' 'kcmutils' 'libepoxy')
makedepends=(
    'kwin'
    'cmake'
    'ninja'
    'patch'
    'extra-cmake-modules'
    'qt6-base'
    'qt6-declarative'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'ki18n'
    'kcmutils'
    'kwindowsystem'
    'vulkan-headers'
)
source=(
    "https://github.com/joepadmiraal/kwin-snow/archive/refs/tags/v${pkgver}.tar.gz"
    "kwin-6.8-paint-returns-bool.patch"
)
sha256sums=('1f464b8980e864011d176e70b1e2f1cf8d049f3fdd87575ce30e1e81b1888653'
            '18fb60bef449820a861a07a43ab017608968323b352934e9b993403069258aa9')

prepare() {
    cd "${srcdir}/kwin-snow-${pkgver}"
    patch -Np2 -i "${srcdir}/kwin-6.8-paint-returns-bool.patch"
}

build() {
    cmake -B "${srcdir}/build" \
        -S "${srcdir}/kwin-snow-${pkgver}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DSNOW_PACKAGE_VERSION="${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSNOW_QT_PLUGIN_DIR=/usr/lib/qt6/plugins \
        -DBUILD_TESTING=OFF
    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
}
