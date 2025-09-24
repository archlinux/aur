# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
pkgname=obs-plugin-browser
pkgver=2.26.1
pkgrel=1
pkgdesc="Official OBS Studio browser plugin, packaged to work with the official Arch package."
arch=(x86_64)
url="https://github.com/ItachiSan/obs-browser-standalone"
license=(GPL-2.0)
depends=(
    # Known dependencies
    obs-studio
    # Detected via namcap
    nlohmann-json
    at-spi2-core
    libxdamage
    libxrandr
)
makedepends=(
    cmake
)

# Latest stable Git commit
_git_commit="9f42f966235ef1c1117b67bfa9ce0216a9e137cf"
# CEF prebuilt package here:
# https://github.com/obsproject/obs-studio/blob/master/build-aux/modules/99-cef.json
# The repo can do it for us, but it is bad practice, so we get it as source and point to it later.
_cef_version=6533
source=("obs-browser_${_git_commit}.tar.gz::${url}/archive/${_git_commit}.tar.gz"
        "https://cdn-fastly.obsproject.com/downloads/cef_binary_${_cef_version}_linux_x86_64_v5.tar.xz")

sha256sums=('53e67dd2148c7502bad6e5c59651087f6fa88d7ec037ab1f71630bdba33b677e'
            'df38ef6d8078895953d224a58dd811b83110b4f8644c5cd2b6246d04b0023ee6')

# Build vars
_git_repo="${url##*/}" # repo name, thanks to: https://unix.stackexchange.com/a/247636
_src_folder="${_git_repo}-${_git_commit}" # easier to cd

pkgver() {
    cd "${_src_folder}"

    _major="$(grep "#define OBS_BROWSER_VERSION_MAJOR" browser-version.h | cut -d' ' -f3)"
    _minor="$(grep "#define OBS_BROWSER_VERSION_MINOR" browser-version.h | cut -d' ' -f3)"
    _patch="$(grep "#define OBS_BROWSER_VERSION_PATCH" browser-version.h | cut -d' ' -f3)"
    echo "${_major}.${_minor}.${_patch}"
}

prepare() {
    # Point to the extracted tarball
    cmake -S "${_src_folder}" . -B build \
        -D CEF_ROOT_DIR="${srcdir}/cef_binary_${_cef_version}_linux_x86_64" \
        -D CMAKE_INSTALL_PREFIX=/usr
}

build() {
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
