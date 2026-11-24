# Maintainer: Muzammil Shafique <muzu@duck.com>
_pkgname=tsuki
pkgname="${_pkgname}-git"
pkgver=0.2.4.r0.g34638f5
pkgrel=1
pkgdesc="Native Linux game launcher for Wine, Proton, and native titles (git version)"
arch=('x86_64')
url="https://github.com/muzammilshafique/tsuki"
license=('GPL-3.0-or-later')
depends=(
    'glibc'
    'gcc-libs'
    'libglvnd'
    'zlib'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'sdl2'
    'hicolor-icon-theme'
    'tar'
)
optdepends=(
    'ttf-jetbrains-mono-nerd: Nerd Font monospace glyphs in diagnostic paths and logs'
    'wine: Windows game compatibility via system Wine'
    'winetricks: Windows runtime component installer'
    'mangohud: In-game FPS and performance overlay'
    'gamemode: CPU governor and system performance optimizations'
    '7zip: 7z archive extraction support'
    'vulkan-icd-loader: Vulkan graphics support for DXVK/VKD3D'
    'lib32-vulkan-icd-loader: 32-bit Vulkan support for 32-bit Windows games'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'pkgconf'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
install=tsuki.install
source=("${_pkgname}::git+https://github.com/muzammilshafique/tsuki.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
      git describe --long --abbrev=7 --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cmake -B build -S "${_pkgname}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DTSUKI_VERSION="${pkgver}"
    cmake --build build
}

check() {
    local test_home="${srcdir}/test-home"
    mkdir -p "${test_home}/.config" "${test_home}/.local/share" "${test_home}/.cache"
    HOME="${test_home}" \
    XDG_CONFIG_HOME="${test_home}/.config" \
    XDG_DATA_HOME="${test_home}/.local/share" \
    XDG_CACHE_HOME="${test_home}/.cache" \
    QT_QPA_PLATFORM=offscreen \
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

