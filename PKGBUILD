#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname="millennium"
pkgname="${_pkgname}-git"
_Pkgname="Millennium"
pkgver=v3.6.3.beta.1.r7.gd6a7822a
pkgrel=1
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
conflicts=(
    "${_pkgname}"
)
source=(
    "git+https://github.com/SteamClientHomebrew/${_Pkgname}.git#branch=main"
    "https://patch-diff.githubusercontent.com/raw/SteamClientHomebrew/Millennium/pull/949.patch" # For the new SteamRT3 build
)
sha256sums=(
    'SKIP'
    '8f9f5c5ad2b8aa5bafd8e543e84d602def01c2dfb8a17ddccfdcc551a36d32fe'
)
options=(!debug)
install="${_pkgname}.install"

pkgver() {
    cd                  "${srcdir}/${_Pkgname}"
    git                 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd                  "${srcdir}/${_Pkgname}"

    # Add custom patches if needed
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch ${src}..."
        git apply -v -3 "../${src}"
    done

    cmake               -GNinja --preset linux-arch-pkgbuild     .

    cmake               -GNinja --preset linux-arch-pkgbuild-x64 .
}

build() {
    cd                  "${srcdir}/${_Pkgname}"

    cmake               --build build
    cmake               --build build64
}

package() {
    cd                  "${srcdir}/${_Pkgname}"

    # Finally, install files to package location
    declare -a files=(
        "build:libmillennium_x86.so"
        "build:libmillennium_hhx64.so"
        "build:libmillennium_bootstrap_x86.so"
        "build:libmillennium_luavm_x86"
        "build:libmillennium_bootstrap_hhx64.so"
        "build:libmillennium_pvs64"
        "build64:libmillennium_x64.so"
        "build64:libmillennium_luavm_x64"
        "build64:libmillennium_bootstrap_x64.so"
    )

    for entry in "${files[@]}"; do
        dir="${entry%%:*}"
        file="${entry##*:}"
        install         -Dm755 "${dir}/${file}" -t "${pkgdir}/usr/lib/millennium/"
    done

    install             -Dm644 'LICENSE.md'     -t "${pkgdir}/usr/share/licenses/millennium/"
}
