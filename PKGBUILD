# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

pkgname=zensmu-bin
pkgver=0.1.1
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
    'ryzen_smu-dkms-git: required DKMS kernel module providing /sys/kernel/ryzen_smu_drv (needed on Arch/CachyOS unless built into a custom kernel)'
    'libglvnd: OpenGL support for zensmu-gui'
    'libxkbcommon: keyboard support for zensmu-gui on Wayland/X11'
    'wayland: native Wayland windowing for zensmu-gui'
    'libxcb: X11 windowing for zensmu-gui'
)
provides=('zensmu')
conflicts=('zensmu' 'zensmu-git')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/brauliobo/zensmu/releases/download/v${pkgver}/zensmu-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0f80e5e9726e816a1d3130e85c758dbf99e48293515f30c6964eca41ed41c095')

package() {
    local root="${srcdir}/zensmu-v${pkgver}-x86_64-unknown-linux-gnu"
    if [[ ! -d "${root}" ]]; then
        root="${srcdir}"
    fi

    # Binaries
    install -Dm755 "${root}/zensmu" "${pkgdir}/usr/bin/zensmu"
    install -Dm755 "${root}/zensmu-gui" "${pkgdir}/usr/bin/zensmu-gui"

    # Systemd boot apply service & suspend/hibernate resume hook
    install -Dm644 "${root}/packaging/systemd/zensmu-apply.service" \
        "${pkgdir}/usr/lib/systemd/system/zensmu-apply.service"
    install -Dm755 "${root}/packaging/systemd/zensmu-resume" \
        "${pkgdir}/usr/lib/systemd/system-sleep/zensmu-resume"

    # PolicyKit policy for unprivileged zensmu-gui -> pkexec /usr/bin/zensmu elevation
    install -Dm644 "${root}/packaging/polkit/org.zensmu.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/org.zensmu.policy"

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

    # Documentation & License
    install -Dm644 "${root}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
