# Maintainer: dalto <dalto at fastmail.com>

pkgbase=zfs-assistant-git
pkgname=(zfs-assistant-git zfs-assistant-cli-git)
pkgver=0.7.0.r1.gb44500a
pkgrel=1
pkgdesc='Manage OpenZFS pools, datasets, snapshots and backups'
arch=(x86_64 aarch64)
url='https://gitlab.com/zfs-assistant/zfs-assistant'
license=(GPL-3.0-or-later)
makedepends=(cargo cmake git pkgconf qt6-base qt6-svg qt6-tools)
source=("$pkgbase::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgbase"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgbase"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgbase"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p zfsa-helper -p zfsa-cli
    cmake -S gui -B build-gui -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DZFSA_BUILD_TESTS=OFF
    cmake --build build-gui
}

package_zfs-assistant-cli-git() {
    pkgdesc+=' (helper and command line tool, git version)'
    depends=(zfs-utils util-linux)
    optdepends=('cron: scheduled snapshots, scrubs and trims on systems without systemd (cronie provides it)'
                'openssh: copying snapshots to other machines')
    provides=("zfs-assistant-cli=${pkgver%%.r*}")
    conflicts=(zfs-assistant-cli)
    backup=(etc/zfs-assistant/zfs-assistant.toml)

    cd "$pkgbase"
    ./install.sh DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib/zfs-assistant TARGETDIR="$PWD/target/release"
}

package_zfs-assistant-git() {
    pkgdesc+=' (desktop application, tray status and notifications, git version)'
    depends=("zfs-assistant-cli-git=$pkgver" qt6-base qt6-svg)
    provides=("zfs-assistant=${pkgver%%.r*}")
    conflicts=(zfs-assistant)

    cd "$pkgbase"
    # CMake installs both desktop programs and their bundled icons
    DESTDIR="$pkgdir" cmake --install build-gui
}
