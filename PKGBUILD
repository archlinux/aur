# Maintainer: Tag Howard <tag@jthoward.dev>
pkgname=rclone-mounts-git
pkgver=0.1.1.r33.g57b910c
pkgrel=1
pkgdesc="Plasma System Settings KCM for managing rclone-backed mounts (SMB, Drive, WebDAV)"
arch=('x86_64' 'aarch64')
url="https://github.com/jthoward64/rclone-mounts"
license=('GPL-2.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'kcoreaddons'
    'ki18n'
    'kcmutils'
    'rclone'
    'polkit'
    'systemd'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'corrosion'
    'rust'
    'git'
)
# The cxx-qt "initializers.o" objects are plain rustc-produced machine code
# (not LTO bitcode); GCC's default LTO link drops their static-constructor
# symbols (undefined reference to `cxx_qt_init_*`), so LTO must stay off.
options=('!lto')
provides=('rclone-mounts')
conflicts=('rclone-mounts')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/rclone-mounts"
    printf "%s.r%s.g%s" \
        "$(grep -m1 '^version' Cargo.toml | sed -E 's/.*"([^"]+)".*/\1/')" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/rclone-mounts"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/rclone-mounts"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$srcdir/rclone-mounts/target"
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_NET_OFFLINE=true

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    cd "$srcdir/rclone-mounts"
    DESTDIR="$pkgdir" cmake --install build
}
