# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

pkgname=zensmu-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Safety-first Rust CLI, live TUI, and unprivileged GUI for AMD Ryzen SMU control and telemetry (prebuilt binary)"
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
provides=('zensmu')
conflicts=('zensmu' 'zensmu-git')
install=zensmu.install
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/brauliobo/zensmu/releases/download/v${pkgver}/zensmu-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c167ed5dda3d884713e3b5186e78e2d61076147cbc18db32f8e71cb3631b2d01')

package() {
    local root="${srcdir}/zensmu-v${pkgver}-x86_64-unknown-linux-gnu"
    if [[ ! -d "${root}" ]]; then
        root="${srcdir}"
    fi

    # Binaries
    install -Dm755 "${root}/zensmu" "${pkgdir}/usr/bin/zensmu"
    install -Dm755 "${root}/zensmu-gui" "${pkgdir}/usr/bin/zensmu-gui"

    # Systemd boot apply service, user telemetry recorder & exporter services, & suspend/hibernate resume hook
    install -Dm644 "${root}/packaging/systemd/zensmu-apply.service" \
        "${pkgdir}/usr/lib/systemd/system/zensmu-apply.service"
    install -Dm644 "${root}/packaging/systemd/zensmu-record.service" \
        "${pkgdir}/usr/lib/systemd/user/zensmu-record.service"
    if [[ -f "${root}/packaging/systemd/zensmu-exporter.service" ]]; then
        install -Dm644 "${root}/packaging/systemd/zensmu-exporter.service" \
            "${pkgdir}/usr/lib/systemd/user/zensmu-exporter.service"
    fi
    install -Dm755 "${root}/packaging/systemd/zensmu-resume" \
        "${pkgdir}/usr/lib/systemd/system-sleep/zensmu-resume"

    # PolicyKit policy for unprivileged zensmu-gui -> pkexec /usr/bin/zensmu elevation
    install -Dm644 "${root}/packaging/polkit/org.zensmu.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/org.zensmu.policy"

    # Desktop launcher & SVG application icon
    if [[ -f "${root}/packaging/desktop/zensmu-gui.desktop" ]]; then
        install -Dm644 "${root}/packaging/desktop/zensmu-gui.desktop" \
            "${pkgdir}/usr/share/applications/zensmu-gui.desktop"
    fi
    if [[ -f "${root}/packaging/desktop/zensmu.svg" ]]; then
        install -Dm644 "${root}/packaging/desktop/zensmu.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zensmu.svg"
    fi

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
    if [[ -d "${root}/packaging/ryzen_smu-dkms" ]]; then
        install -dm755 "${pkgdir}/usr/share/zensmu/ryzen_smu-dkms"
        for f in drv.c smu.c smu.h Makefile LICENSE dkms.conf VERSION; do
            if [[ -f "${root}/packaging/ryzen_smu-dkms/${f}" ]]; then
                install -Dm644 "${root}/packaging/ryzen_smu-dkms/${f}" \
                    "${pkgdir}/usr/share/zensmu/ryzen_smu-dkms/${f}"
            fi
        done
    fi

    # Documentation & License
    install -Dm644 "${root}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
