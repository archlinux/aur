# Maintainer: MotherSphere <mothersphere.colony@gmail.com>
pkgname=colony-git
_pkgname=colony
pkgver=r0.0
pkgrel=8
pkgdesc="Application launcher for the Project-Colony ecosystem (git HEAD)"
arch=('x86_64')
url="https://github.com/Project-Colony/Colony"
license=('GPL-3.0-or-later')
# makepkg's `lto` option injects -flto=auto into CFLAGS; ring's C objects then
# carry GCC LTO bitcode that rust-lld (default linker since Rust 1.90) cannot
# read, and the final link dies with `undefined symbol: ring_core_*`.
options=('!lto')
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
    # instead of bundled/vendored builds.
    export ZSTD_SYS_USE_PKG_CONFIG=1
    export PKG_CONFIG_ALL_DYNAMIC=1
    # libdbus-sys ne propage pas toujours `-ldbus-1` via pkg-config selon
    # l'environnement (bug observé avec rust-lld sur certaines versions).
    # On force le flag directement via RUSTFLAGS pour que le link final
    # résolve dbus_error_init & co.
    export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-ldbus-1"
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Ship the upstream LICENSE in /usr/share/licenses per Arch convention.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # The hicolor icon the desktop entry references (in-tree since v0.8.0).
    if [ -f assets/icons/icon.png ]; then
        install -Dm644 assets/icons/icon.png \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    fi

    # Desktop entry so GNOME/KDE/rofi/wofi launchers pick up Colony.
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/colony.desktop" <<'EOF'
[Desktop Entry]
Name=Colony
GenericName=Application Launcher
Comment=Application launcher for the Project-Colony ecosystem
Exec=colony
Icon=colony
Terminal=false
Type=Application
Categories=Utility;System;
Keywords=launcher;apps;project-colony;
StartupNotify=true
EOF
}
