# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

pkgname=zensmu-git
pkgver=0.3.3.r0.g9a73608
pkgrel=1
pkgdesc="Safety-first Rust CLI, live TUI, and unprivileged GUI for AMD Ryzen SMU control and telemetry"
arch=('x86_64')
url="https://github.com/brauliobo/zensmu"
license=('MIT')
depends=(
    'polkit'
    'gcc-libs'
    'glibc'
)
optdepends=(
    'dkms: automatically build and install bundled ryzen_smu kernel driver on package install/upgrade'
    'ryzen_smu-dkms-git: standalone AUR DKMS package for ryzen_smu (auto-detected and left untouched if installed)'
    'libglvnd: OpenGL support for zensmu-gui'
    'libxkbcommon: keyboard support for zensmu-gui on Wayland/X11'
    'wayland: native Wayland windowing for zensmu-gui'
    'libxcb: X11 windowing for zensmu-gui'
)
makedepends=(
    'rust'
    'cargo'
    'git'
)
provides=('zensmu')
conflicts=('zensmu' 'zensmu-bin')
install=zensmu.install
source=(
    "${pkgname}::git+https://github.com/brauliobo/zensmu.git"
    "ryzen_smu::git+https://github.com/amkillam/ryzen_smu.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "0.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --workspace
}

check() {
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --workspace
}

package() {
    cd "${srcdir}/${pkgname}"

    # Binaries
    install -Dm755 "target/release/zensmu" "${pkgdir}/usr/bin/zensmu"
    install -Dm755 "target/release/zensmu-gui" "${pkgdir}/usr/bin/zensmu-gui"

    # Systemd boot apply service, user telemetry recorder & exporter services, & suspend/hibernate resume hook
    install -Dm644 "packaging/systemd/zensmu-apply.service" \
        "${pkgdir}/usr/lib/systemd/system/zensmu-apply.service"
    install -Dm644 "packaging/systemd/zensmu-record.service" \
        "${pkgdir}/usr/lib/systemd/user/zensmu-record.service"
    install -Dm644 "packaging/systemd/zensmu-exporter.service" \
        "${pkgdir}/usr/lib/systemd/user/zensmu-exporter.service"
    install -Dm755 "packaging/systemd/zensmu-resume" \
        "${pkgdir}/usr/lib/systemd/system-sleep/zensmu-resume"

    # PolicyKit policy for unprivileged zensmu-gui -> pkexec /usr/bin/zensmu elevation
    install -Dm644 "packaging/polkit/org.zensmu.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/org.zensmu.policy"

    # Desktop launcher & SVG application icon
    install -Dm644 "packaging/desktop/zensmu-gui.desktop" \
        "${pkgdir}/usr/share/applications/zensmu-gui.desktop"
    install -Dm644 "packaging/desktop/zensmu.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zensmu.svg"

    # Profile directory
    install -dm755 "${pkgdir}/etc/zensmu"

    # Shell completions
    install -dm755 \
        "${pkgdir}/usr/share/bash-completion/completions" \
        "${pkgdir}/usr/share/zsh/site-functions" \
        "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${pkgdir}/usr/bin/zensmu" completions bash > "${pkgdir}/usr/share/bash-completion/completions/zensmu"
    "${pkgdir}/usr/bin/zensmu" completions zsh  > "${pkgdir}/usr/share/zsh/site-functions/_zensmu"
    "${pkgdir}/usr/bin/zensmu" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/zensmu.fish"

    # Man page
    install -dm755 "${pkgdir}/usr/share/man/man1"
    "${pkgdir}/usr/bin/zensmu" manpage > "${pkgdir}/usr/share/man/man1/zensmu.1"

    # Bundled ryzen_smu DKMS sources (auto-built/removed by zensmu.install unless external ryzen_smu exists)
    if [[ -d "${srcdir}/ryzen_smu" ]]; then
        local smu_rev smu_sha smu_ver
        smu_rev="$(git -C "${srcdir}/ryzen_smu" rev-list --count HEAD)"
        smu_sha="$(git -C "${srcdir}/ryzen_smu" rev-parse --short=7 HEAD)"
        smu_ver="0.1.7.r${smu_rev}.g${smu_sha}"
        install -dm755 "${pkgdir}/usr/share/zensmu/ryzen_smu-dkms"
        for f in drv.c smu.c smu.h Makefile LICENSE; do
            install -Dm644 "${srcdir}/ryzen_smu/${f}" \
                "${pkgdir}/usr/share/zensmu/ryzen_smu-dkms/${f}"
        done
        printf '%s\n' "${smu_ver}" > "${pkgdir}/usr/share/zensmu/ryzen_smu-dkms/VERSION"
        cat > "${pkgdir}/usr/share/zensmu/ryzen_smu-dkms/dkms.conf" <<EOF
PACKAGE_NAME="ryzen_smu"
PACKAGE_VERSION="${smu_ver}"
MAKE[0]="make -C \$kernel_source_dir M=\$dkms_tree/\$PACKAGE_NAME/\$PACKAGE_VERSION/build modules"
BUILT_MODULE_NAME[0]="ryzen_smu"
DEST_MODULE_LOCATION[0]="/kernel/drivers/ryzen_smu"
AUTOINSTALL="yes"
EOF
    fi

    # Documentation & License
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
