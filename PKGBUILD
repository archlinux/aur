#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname="millennium"
pkgbase="${_pkgname}-git"
pkgname=(
    "${_pkgname}-git"
    "${_pkgname}-x86-git"
)
_Pkgname="Millennium"
pkgver=v3.6.3.beta.1.r7.gd6a7822a
pkgrel=4
pkgdesc="${_Pkgname} is an open-source low-code modding framework to create, manage and use themes/plugins for the desktop Steam Client without any low-level internal interaction or overhead. (git-version, next branch)"
arch=('x86_64')
url="https://steambrew.app"
license=('MIT')
depends=(
    'steam'
)
makedepends=(
    'git'
    'bun'
    'curl'
    'zip'
    'unzip'
    'tar'
    'cmake'
    'ninja'
    'rust'
    'openssl'
    'lib32-gcc-libs'
    'lib32-openssl'
    'lib32-libidn2'
    'lib32-xz'
    'lib32-zstd'
    'lib32-brotli'
    'lib32-libnghttp2'
    'lib32-libpsl'
    'libx11'
    'libxi'
    'libxtst'
)
provides=("${_pkgname}=${pkgver}")
source=(
    "git+https://github.com/SteamClientHomebrew/${_Pkgname}.git#branch=main"
    'https://patch-diff.githubusercontent.com/raw/SteamClientHomebrew/Millennium/pull/949.patch' # For the new SteamRT3 build
)
sha256sums=('SKIP'
            'e934cfcdf8eb01224abcd77c20e5689a8857020ab5921c0bda850da8287b7643')
options=(!debug)
install="${_pkgname}.install"

pkgver() {
    cd      "${srcdir}/${_Pkgname}"
    git     describe --long --tags | \
    sed     's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd      "${srcdir}/${_Pkgname}"

    # Add custom patches if needed
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch ${src}..."
        git  apply -v -3 "../${src}"
    done
}

build() {
    cd      "${srcdir}/${_Pkgname}"

    # strip nodlopen, it'll break steamRT3 sandboxing
    LDFLAGS="$(echo   "${LDFLAGS}"   | sed -E 's/-Wl,-z,nodlopen$//g; s/,-z,nodlopen//g')"
    RUSTFLAGS="$(echo "${RUSTFLAGS}" | sed -E 's/-Wl,-z,nodlopen$//g; s/,-z,nodlopen//g')"

    # strip omp and pthread for m32 build, as this will cause issues otherwise when linking to libs we don't package for m32.
    LDFLAGS_NEW="$(echo   "${LDFLAGS}"   | sed -E 's/-l(omp|pthread)$//g; s/,-l(omp|pthread)//g')"
    RUSTFLAGS_NEW="$(echo "${RUSTFLAGS}" | sed -E 's/-l(omp|pthread)$//g; s/,-l(omp|pthread)//g')"

    env LDFLAGS="${LDFLAGS_NEW}" RUSTFLAGS="${RUSTFLAGS_NEW}" \
    cmake   -GNinja --preset linux-arch-pkgbuild-x86 .
    env LDFLAGS="${LDFLAGS}"     RUSTFLAGS="${RUSTFLAGS}"     \
    cmake   -GNinja --preset linux-arch-pkgbuild     .

    cmake   --build build
    cmake   --build build32
}

_install_millennium_variant() {
    install -Dm755 "${_build_dir}/lib${_pkgname}_${_arch}.so"           -t "${pkgdir}/usr/lib/${_pkgname}/"
    install -Dm755 "${_build_dir}/lib${_pkgname}_bootstrap_${_arch}.so" -t "${pkgdir}/usr/lib/${_pkgname}/"
    install -Dm755 "${_build_dir}/lib${_pkgname}_luavm_${_arch}"        -t "${pkgdir}/usr/lib/${_pkgname}/"
    install -Dm755 "build/lib${_pkgname}_pvs64"                         -t "${pkgdir}/usr/lib/${_pkgname}/"
    install -Dm644 'LICENSE.md'                                         -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_millennium-git() {
    cd      "${srcdir}/${_Pkgname}"

    _arch="x64"
    _build_dir="build"

    _install_millennium_variant

    install -Dm755 "build/lib${_pkgname}_hhx64.so"                      -t "${pkgdir}/usr/lib/${_pkgname}/"
    install -Dm755 "build/lib${_pkgname}_bootstrap_hhx64.so"            -t "${pkgdir}/usr/lib/${_pkgname}/"
}

package_millennium-x86-git() {
    cd      "${srcdir}/${_Pkgname}"

    _arch="x86"
    _build_dir="build32"

    _install_millennium_variant
}
