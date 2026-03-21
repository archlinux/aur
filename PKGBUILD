# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname="millennium"
pkgname="${_pkgname}-git"
_Pkgname="Millennium"
pkgver=v2.35.0.r26.ge4229483
pkgrel=2
pkgdesc="${_Pkgname} is an open-source low-code modding framework to create, manage and use themes/plugins for the desktop Steam Client without any low-level internal interaction or overhead."
arch=('x86_64')
url="https://steambrew.app"
license=('MIT')
depends=('git' 'steam')
makedepends=('npm' 'curl' 'zip' 'unzip' 'tar' 'cmake' 'ninja' 'lib32-gcc-libs' 'pnpm')
depends_x86_64=('lib32-python311-bin')
provides=("${_pkgname}=${pkgver}")
conflicts=(
    "${_pkgname}"
)
source=(
    "git+https://github.com/SteamClientHomebrew/${_Pkgname}.git#branch=main"
    # Add patches after this line!
)
sha256sums=(
    'SKIP'
    # Add checksums for patches after this line!
)
options=(!debug)
install="${_pkgname}.install"

prepare() {
    cd "${srcdir}/${_Pkgname}"

    # Add custom patches if needed
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ ${src} = *.patch ]] || continue
        echo "Applying patch $src..."
        git apply -v "../$src"
    done
}

pkgver() {
    cd              "${srcdir}/${_Pkgname}"
    git             describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd              "${srcdir}/${_Pkgname}"

    echo -e         "\e[1m\e[92m==>\e[0m \e[1mBuilding ${_Pkgname} assets...\e[0m"

    pnpm --dir      src/sdk         install
    pnpm --dir      src/sdk         run build

    pnpm --dir      src/frontend    install
    pnpm --dir      src/frontend    run prod
}

build() {
    cd              "${srcdir}/${_Pkgname}"

    echo -e         "\e[1m\e[92m==>\e[0m \e[1mBuilding ${_Pkgname}...\e[0m"

    cmake -GNinja   . -DCMAKE_BUILD_TYPE=RelWithDebInfo --preset linux-release -DDISTRO_ARCH=ON
    cmake --build   build
}

package() {
    cd              "${srcdir}/${_Pkgname}"

    echo -e         "\e[1m\e[92m==>\e[0m \e[1mPackaging ${_Pkgname}...\e[0m"

    # Create final directory structure
    mkdir -p        "${pkgdir}/usr/lib/${_pkgname}"
    mkdir -p        "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p        "${pkgdir}/usr/share/millennium/assets"

    # Finally, install files to package location
    install -Dm755  build/libmillennium_x86.so                      "${pkgdir}/usr/lib/${_pkgname}/"
    install -Dm755  build/hhx64/libmillennium_hhx64.so              "${pkgdir}/usr/lib/${_pkgname}/"
    install -Dm755  build/boot/linux/libmillennium_bootstrap_86x.so "${pkgdir}/usr/lib/${_pkgname}/"
    install -Dm644  LICENSE.md                                      "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Generate shims
    mv              src/pipx                                        "${pkgdir}/usr/share/millennium/assets/pipx"
}
