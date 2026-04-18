# Maintainer: MotherSphere <mothersphere.colony@gmail.com>
pkgname=colony-git
_pkgname=colony
pkgver=r0.0
pkgrel=2
pkgdesc="Application launcher for the Project-Colony ecosystem (git HEAD)"
arch=('x86_64')
url="https://github.com/Project-Colony/Colony"
license=('Unknown')
depends=(
    'gcc-libs'
    'openssl'
    'xz'
    'bzip2'
    'zstd'
    'gtk3'
    'xdotool'
    'dbus'
    'vulkan-icd-loader'
)
makedepends=('git' 'cargo' 'pkgconf')
provides=('colony')
conflicts=('colony' 'colony-bin')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CARGO_TARGET_DIR=target
    # Force -sys crates to link against system libraries via pkg-config
    # instead of bundled/vendored builds. Without these, zstd-sys and
    # libdbus-sys fail to emit -lzstd / -ldbus-1 and the final link fails
    # with "undefined symbol: ZSTD_freeDCtx / dbus_error_init".
    export ZSTD_SYS_USE_PKG_CONFIG=1
    export PKG_CONFIG_ALL_DYNAMIC=1
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
