# Maintainer: Marek Samec <samec.marek@gmail.com>
pkgname=nvbeam-git
_pkgname=nvbeam
pkgver=0.2.10.r21.g7c2c129
pkgrel=1
pkgdesc="Fast, native Neovim GUI client built with Qt6 and C++ (git)"
arch=('x86_64')
url="https://github.com/mareksamec/nvbeam"
license=('MIT')
depends=(
    'qt6-base'
    'qtermwidget'
    'syntax-highlighting'
    'neovim>=0.10'
    'hicolor-icon-theme'
)
makedepends=(
    'git'
    'cmake'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!lto')

# Vendor toml11 v4.2.0 so the build is hermetic (no network in build()).
# build() hands the extracted source to FetchContent instead of letting it clone.
_toml11_ver=4.2.0
_toml11_sha256=9287971cd4a1a3992ef37e7b95a3972d1ae56410e7f8e3f300727ab1d6c79c2c

source=(
    "${_pkgname}::git+${url}.git"
    "toml11-${_toml11_ver}.tar.gz::https://github.com/ToruNiina/toml11/archive/refs/tags/v${_toml11_ver}.tar.gz"
)
sha256sums=(
    'SKIP'
    "${_toml11_sha256}"
)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    # Produces:
    #   <tag>.r<commits-since-tag>.g<short-sha>  if any tag exists
    #   r<total-commits>.<short-sha>             otherwise
    (
        git describe --long --tags 2>/dev/null \
            | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    ) || printf 'r%s.%s' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    # FETCHCONTENT_SOURCE_DIR_TOML11 makes FetchContent use the vendored
    # toml11 checkout instead of cloning it.
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFETCHCONTENT_SOURCE_DIR_TOML11="${srcdir}/toml11-${_toml11_ver}" \
        -DNVBEAM_TERMINAL=ON \
        -DNVBEAM_SYNTAX=ON \
        -Wno-dev
    cmake --build build -j"$(nproc)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="${pkgdir}" cmake --install build

    # MIT license: AUR/namcap expects it under /usr/share/licenses/<pkg>/
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
