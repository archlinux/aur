# Maintainer: Plan-B-Development <https://github.com/Plan-B-Development>
pkgname=control-ofc-daemon
pkgver=1.17.3
pkgrel=1
pkgdesc="Hardware fan control daemon for Linux (OpenFan, hwmon, GPU)"
arch=('x86_64')
url="https://github.com/Plan-B-Development/control-ofc-daemon"
license=('MIT')
depends=('glibc' 'systemd-libs' 'libgcc')
optdepends=(
    'lm_sensors: sensors verification CLI; sensors-detect (last resort) for chips not covered by the built-in module list'
    'it87-dkms-git: out-of-tree driver for ITE 8625E/8686E/8688E/8689E/8696E/87952E (most newer Gigabyte boards)'
    'nct6687d-dkms-git: out-of-tree driver for Nuvoton NCT6687-R (most newer MSI boards)'
    'nct6686d-dkms-git: out-of-tree driver for Nuvoton NCT6686D (some newer ASRock boards)'
    'dkms: required by the *-dkms-git driver packages above'
    'linux-headers: required by DKMS to build out-of-tree drivers (must match your running kernel)'
)
# `rust` provides `cargo`; do not list both.
makedepends=('rust' 'scdoc')
backup=('etc/control-ofc/daemon.toml'
        'etc/control-ofc/profiles/quiet.json'
        'etc/modules-load.d/control-ofc.conf')
install=control-ofc-daemon.install
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f886d6540edfb4ecea2078c24abd71fa9651292f61eef3e48a24149ef34d7c67')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release

    # Render man page from scdoc source.
    scdoc < man/control-ofc-daemon.1.scd > control-ofc-daemon.1
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 target/release/control-ofc-daemon "$pkgdir/usr/bin/control-ofc-daemon"

    # Restore script (runs on daemon stop to return fans to automatic)
    install -Dm755 packaging/control-ofc-restore-auto.sh "$pkgdir/usr/bin/control-ofc-restore-auto"

    # systemd service
    install -Dm644 packaging/control-ofc-daemon.service "$pkgdir/usr/lib/systemd/system/control-ofc-daemon.service"

    # Default config
    install -Dm644 packaging/daemon.toml.example "$pkgdir/etc/control-ofc/daemon.toml"

    # Profile drop-in directory (admin-owned, GUI reads from here after copy).
    # The daemon's own runtime state lives under /var/lib/control-ofc/, which
    # systemd creates via StateDirectory= in the unit file.
    install -dm755 "$pkgdir/etc/control-ofc/profiles"

    # Example profile — safe to ship (empty members list, drives no fans).
    # Gives first-run users a working schema reference. Covered by backup=()
    # so pacman preserves user edits across upgrades (.pacnew pattern).
    install -Dm644 packaging/profiles/quiet.json "$pkgdir/etc/control-ofc/profiles/quiet.json"

    # Optional udev rules example (documentation only).
    # The daemon auto-detects the OpenFan controller on /dev/ttyACM* and
    # /dev/ttyUSB* at startup — no udev rule is required for normal operation.
    # Ship the rule as a reference for users who want a stable
    # /dev/control-ofc-controller symlink; they copy it into
    # /etc/udev/rules.d/ and fill in their VID/PID.
    install -Dm644 packaging/99-control-ofc.rules \
        "$pkgdir/usr/share/doc/$pkgname/99-control-ofc.rules.example"

    # Kernel module loading — Super I/O chipset drivers that expose
    # motherboard fan headers and sensors. See packaging/modules-load.d/
    # for rationale. Covered by backup=() so pacman preserves user edits.
    install -Dm644 packaging/modules-load.d/control-ofc.conf \
        "$pkgdir/etc/modules-load.d/control-ofc.conf"

    # Man page (rendered in build())
    install -Dm644 control-ofc-daemon.1 \
        "$pkgdir/usr/share/man/man1/control-ofc-daemon.1"

    # Shell completions — installed unconditionally; missing shells ignore them.
    install -Dm644 completions/control-ofc-daemon.bash \
        "$pkgdir/usr/share/bash-completion/completions/control-ofc-daemon"
    install -Dm644 completions/_control-ofc-daemon \
        "$pkgdir/usr/share/zsh/site-functions/_control-ofc-daemon"
    install -Dm644 completions/control-ofc-daemon.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/control-ofc-daemon.fish"

    # User-facing documentation. The post_install message points users here,
    # so they actually find a setup guide instead of just the udev example.
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 daemon.md "$pkgdir/usr/share/doc/$pkgname/daemon.md"
    install -Dm644 docs/USER_GUIDE.md "$pkgdir/usr/share/doc/$pkgname/USER_GUIDE.md"
    install -Dm644 docs/DEVELOPER_HANDOVER.md \
        "$pkgdir/usr/share/doc/$pkgname/DEVELOPER_HANDOVER.md"
    install -Dm644 docs/ADRs/001-ipc-transport.md \
        "$pkgdir/usr/share/doc/$pkgname/ADRs/001-ipc-transport.md"
    install -Dm644 docs/ADRs/002-runtime-config-split.md \
        "$pkgdir/usr/share/doc/$pkgname/ADRs/002-runtime-config-split.md"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
