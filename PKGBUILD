# Maintainer: hmtheboy154 <buingoc67@gmail.com>

_pkgname=remmina-plugin-ultraviewer
pkgname="${_pkgname}-git"
pkgver=0.2.1.r0.g939bf27
pkgrel=1
pkgdesc="UltraViewer remote desktop protocol plugin for Remmina"
arch=('x86_64')
url="https://github.com/hmtheboy154/remmina-plugin-ultraviewer"
license=('GPL-2.0-or-later')
depends=(
    'remmina'
    'gtk3'
    'openssl'
    'zstd'
    'libjpeg-turbo'
    'libpulse'
)
makedepends=(
    'git'
    'cmake'
    'pkgconf'
    'innoextract'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

_installer="UltraViewer_setup_6.6.133_vi.exe"
source=(
    "${_pkgname}::git+https://github.com/hmtheboy154/remmina-plugin-ultraviewer.git#branch=main"
    "${_installer}::https://dl2.ultraviewer.net/UltraViewer_setup_6.6.133_vi.exe"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    if git describe --tags >/dev/null 2>&1; then
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "0.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    # Extract official 8bit.dat dictionary from Inno Setup installer
    if [ ! -f "assets/8bit.dat" ]; then
        mkdir -p assets/inno_tmp
        if command -v innoextract >/dev/null 2>&1; then
            innoextract -e -s --output-dir assets/inno_tmp "${srcdir}/${_installer}" >/dev/null
            find assets/inno_tmp -name "8bit.dat" -exec mv -f {} assets/8bit.dat \; 2>/dev/null || true
            rm -rf assets/inno_tmp
        fi

        # Verify cryptographic checksum
        local _expected="9aa45789d9ff9d329a623a685d57b67e33c777019de9ce1f273f21860e4bfe6b"
        local _actual
        if [ -f "assets/8bit.dat" ]; then
            _actual="$(sha256sum assets/8bit.dat | awk '{print $1}')"
            if [ "${_actual}" != "${_expected}" ]; then
                echo "[-] Error: 8bit.dat SHA-256 checksum mismatch!" >&2
                return 1
            fi
        else
            echo "[-] Error: Failed to extract assets/8bit.dat from ${_installer}." >&2
            echo "    Please verify that 'innoextract' is installed." >&2
            return 1
        fi
    fi
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build build
}

check() {
    cd "${srcdir}/${_pkgname}"
    ctest --test-dir build --output-on-failure
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
}
