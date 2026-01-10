# Maintainer: Leonard Seibold <git@zrtx.de>
pkgname=zlaunch-git
pkgver=r0.0.0
pkgrel=1
pkgdesc='A fast application launcher for Linux wayland desktops built with GPUI'
arch=('x86_64' 'aarch64')
url='https://github.com/zortax/zlaunch'
license=('MIT')
depends=(
    'wayland'
    'freetype2'
    'fontconfig'
    'openssl'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxcb'
    'vulkan-icd-loader'
)
makedepends=(
    'cargo'
    'git'
    'pkg-config'
    'wayland-protocols'
)
provides=('zlaunch')
conflicts=('zlaunch' 'zlaunch-bin')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    if git describe --tags --abbrev=7 HEAD &>/dev/null; then
        git describe --long --tags --abbrev=7 HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}"
    install -Dm755 target/release/zlaunch "${pkgdir}/usr/bin/zlaunch"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
