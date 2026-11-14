# Maintainer: dalto <dalto at fastmail.com>

pkgbase=zfs-assistant
pkgname=(zfs-assistant zfs-assistant-cli)
pkgver=0.8.0
pkgrel=1
pkgdesc='Manage OpenZFS pools, datasets, snapshots and backups'
arch=(x86_64 aarch64)
url='https://gitlab.com/zfs-assistant/zfs-assistant'
license=(GPL-3.0-or-later)
makedepends=(cargo cmake pkgconf qt6-base qt6-svg qt6-tools)
source=("$pkgbase-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha256sums=('22d4c41b4449e686c8ccfce24158fe1468e7f10dceaf85cf8eec10563fbc8b74')

prepare() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p zfsa-helper -p zfsa-cli
    cmake -S gui -B build-gui -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DZFSA_BUILD_TESTS=OFF
    cmake --build build-gui
}

package_zfs-assistant-cli() {
    pkgdesc+=' (helper and command line tool)'
    depends=(zfs-utils util-linux)
    optdepends=('cron: scheduled snapshots, scrubs and trims on systems without systemd'
                'openssh: copying snapshots to other machines')
    backup=(etc/zfs-assistant/zfs-assistant.toml)

    cd "$pkgbase-$pkgver"
    ./install.sh DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib/zfs-assistant TARGETDIR="$PWD/target/release"
}

package_zfs-assistant() {
    pkgdesc+=' (desktop application, tray status and notifications)'
    depends=("zfs-assistant-cli=$pkgver" qt6-base qt6-svg)

    cd "$pkgbase-$pkgver"
    # CMake installs both desktop programs and their bundled icons
    DESTDIR="$pkgdir" cmake --install build-gui
}
