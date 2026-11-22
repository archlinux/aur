# Maintainer: Glass Alarm Developer
# Contributor: Arch Linux User

pkgname=lumalarm
pkgver=1.0.5
pkgrel=1
pkgdesc="Glassmorphism alarm clock for Linux with rtcwake, D-Bus wake helper, multilingual UI and emoji-density control"
arch=('x86_64' 'aarch64')
url="https://github.com/shinigami1231111/lumalarm"
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-multimedia'
    'qt6-declarative'
    'util-linux'
)
makedepends=(
    'cmake'
    'gcc'
    'qt6-tools'
)
optdepends=(
    'kwindowsystem: native KDE/KWin blur-behind (requires a rebuild with blur enabled)'
)
install=lumalarm.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shinigami1231111/lumalarm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('418c7e93dc295a4a4e548ea184ac37b0a25dca1b2dcc9bd6bd5bed47f1cbc638')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # KDE blur is optional and needs KF6WindowSystem at build AND run time;
    # keep the AUR build portable. Native translucency still works.
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS="-O2 -pipe" \
        -DLUMALARM_ENABLE_KDE_BLUR=OFF

    # Cap parallel jobs at 80% of available CPUs (never more, never zero).
    local jobs=$(( $(nproc) * 80 / 100 ))
    [ "$jobs" -lt 1 ] && jobs=1
    cmake --build build -j"$jobs"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/${pkgname}/tones"
    install -Dm644 resources/lumalarm.desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # STG-1.6: no sudoers rule. The D-Bus helper + polkit action are installed
    # by CMake; lumalarm.install removes any legacy rule on upgrade.
}
