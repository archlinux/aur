# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname="millennium"
pkgname="${_pkgname}-git"
_Pkgname="Millennium"
pkgver=v3.0.0.beta.24.r107.g6db3637a
pkgrel=2
pkgdesc="${_Pkgname} is an open-source low-code modding framework to create, manage and use themes/plugins for the desktop Steam Client without any low-level internal interaction or overhead."
arch=('x86_64')
url="https://steambrew.app"
license=('MIT')
depends=(
    'git'
    'steam'
)
makedepends=(
    'bun'
    'curl'
    'zip'
    'unzip'
    'tar'
    'cmake'
    'ninja'
    'lib32-gcc-libs'
    'lib32-openssl'
    'lib32-libidn2'
    'lib32-xz'
    'lib32-zstd'
    'lib32-brotli'
    'lib32-libnghttp2'
    'lib32-libpsl'
    'libx11'
    'libxtst'
)
depends_x86_64=('lib32-python311-bin')
provides=("${_pkgname}=${pkgver}")
conflicts=(
    "${_pkgname}"
)
source=(
    "git+https://github.com/SteamClientHomebrew/${_Pkgname}.git#branch=next"
)
sha256sums=('SKIP')
options=(!debug)
install="${_pkgname}.install"

pkgver() {
    cd              "${srcdir}/${_Pkgname}"
    git             describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd              "${srcdir}/${_Pkgname}"

    echo -e         "\e[1m\e[92m==>\e[0m \e[1mAdding any listed patches...\e[0m"

    # Add custom patches if needed
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        git apply -v "../$src"
    done

    echo -e         "\e[1m\e[92m==>\e[0m \e[1mConfiguring ${_Pkgname}...\e[0m"

    cmake -GNinja   . -DCMAKE_BUILD_TYPE=RelWithDebInfo --preset linux-release -DDISTRO_ARCH=ON
}

build() {
    cd              "${srcdir}/${_Pkgname}"

    echo -e         "\e[1m\e[92m==>\e[0m \e[1mBuilding ${_Pkgname}...\e[0m"

    cmake --build   build
}

package() {
    cd              "${srcdir}/${_Pkgname}"

    echo -e         "\e[1m\e[92m==>\e[0m \e[1mPackaging ${_Pkgname}...\e[0m"

    # Create final directory structure
    mkdir -p        "${pkgdir}/usr/lib/${_pkgname}"
    mkdir -p        "${pkgdir}/usr/share/licenses/${pkgname}"

    # Finally, install files to package location
    install -Dm755  build/libmillennium_x86.so               "${pkgdir}/usr/lib/millennium/"
    install -Dm755  build/libmillennium_hhx64.so             "${pkgdir}/usr/lib/millennium/"
    install -Dm755  build/libmillennium_bootstrap_x86.so     "${pkgdir}/usr/lib/millennium/"
    install -Dm755  build/libmillennium_luavm_x86            "${pkgdir}/usr/lib/millennium/"
    install -Dm755  build/libmillennium_bootstrap_hhx64.so   "${pkgdir}/usr/lib/millennium/"
    install -Dm644  LICENSE.md                               "${pkgdir}/usr/share/licenses/${pkgname}/"
}
