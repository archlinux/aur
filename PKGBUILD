# Maintainer: Daniel Nesterov <KOfTD at yandex dot ru>

pkgbase=lenocon-git
pkgname=('lenocon-cli-git' 'lenocon-daemon-git')
pkgver=v1.1.0.r0.gb9fb18c
pkgrel=1
url="https://github.com/KofTD/lenocon"
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('cargo'
             'git')
source=("git+${url}"
        "lenocon-daemon.policy")
sha256sums=("SKIP"
            "dffc1777ac4ee9fc5e96c9490c950eaed9c6d2bc6765d6fe1d3ab44a9d0d355f")
options=('!debug')

prepare() {
    local conservation_file="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
    if [[ ! -f "$conservation_file" ]]; then
        echo "ERROR: $conservation_file not found."
        echo "This package is only supported on Lenovo IdeaPad/ThinkBook laptops."
        echo ""
        echo "If you are sure it's a mistake then make an issue please: ${url}"
        exit 1
    fi
    cd "${pkgbase%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

pkgver() {
    cd "${pkgbase%-git}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgbase%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgbase%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package_lenocon-cli-git() {
    pkgdesc="CLI tool to manage Lenovo conservation mode"
    depends=('glibc'
             'libgcc')

    install -Dm755 lenocon/target/release/lenocon-cli \
        "$pkgdir/usr/bin/lenocon"
}

package_lenocon-daemon-git() {
    pkgdesc="System tray daemon for Lenovo conservation mode"
    depends=('lenocon-cli-git'
             'polkit'
             'glibc'
             'libgcc')
    install -Dm755 lenocon/target/release/lenocon-daemon \
        "$pkgdir/usr/bin/lenocon-daemon"
    install -Dm644 lenocon-daemon.policy \
        "$pkgdir/usr/share/polkit-1/actions/org.lenocon-daemon.policy"
}
