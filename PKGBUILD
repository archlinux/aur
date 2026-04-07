# Maintainer: Halo AI <echo@haloai.dev>
pkgname=halo-ai
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Bare-metal AI stack for AMD Strix Halo — Lemonade v10.1.0, Gemma 4, 91 tok/s, 123GB GPU"
arch=('x86_64')
url="https://github.com/stampby/halo-ai"
license=('Apache-2.0')
depends=(
    'python'
    'python-pip'
    'python-virtualenv'
    'git'
    'cmake'
    'ninja'
    'base-devel'
    'vulkan-headers'
    'vulkan-icd-loader'
    'vulkan-radeon'
    'opencl-headers'
    'ocl-icd'
    'opencl-clhpp'
    'sqlite'
    'mariadb-libs'
    'caddy'
    'nftables'
    'fail2ban'
)
optdepends=(
    'rocm-hip-sdk: ROCm GPU acceleration for gfx1151'
    'wireguard-tools: VPN remote access'
    'qrencode: QR codes for VPN client configs'
    'asciinema: terminal recording'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')
backup=(
    'srv/ai/configs/Caddyfile'
    'srv/ai/configs/searxng/settings.yml'
)

package() {
    cd "${srcdir}/${pkgname}-main"

    # Install configs
    install -Dm644 configs/Caddyfile "${pkgdir}/srv/ai/configs/Caddyfile"
    install -Dm644 configs/searxng/settings.yml "${pkgdir}/srv/ai/configs/searxng/settings.yml"
    install -Dm644 configs/rocm.env "${pkgdir}/srv/ai/configs/rocm.env"
    install -Dm644 configs/system/nftables.conf "${pkgdir}/etc/nftables.conf"
    install -Dm644 configs/system/70-amdgpu.rules "${pkgdir}/etc/udev/rules.d/70-amdgpu.rules"
    install -Dm600 configs/system/90-halo-security.conf "${pkgdir}/etc/ssh/sshd_config.d/90-halo-security.conf"

    # Install systemd units
    for svc in systemd/halo-*.service; do
        install -Dm644 "$svc" "${pkgdir}/usr/lib/systemd/system/$(basename $svc)"
    done
    for tmr in systemd/halo-*.timer; do
        [ -f "$tmr" ] && install -Dm644 "$tmr" "${pkgdir}/usr/lib/systemd/system/$(basename $tmr)"
    done

    # Install scripts
    install -Dm755 install.sh "${pkgdir}/srv/ai/install.sh"
    for script in scripts/*.sh scripts/*.py; do
        [ -f "$script" ] && install -Dm755 "$script" "${pkgdir}/srv/ai/scripts/$(basename $script)"
    done

    # Install agent
    install -Dm755 agent/halo-agent.py "${pkgdir}/srv/ai/agent/halo-agent.py"

    # Install dashboard
    install -dm755 "${pkgdir}/srv/ai/dashboard-api"
    cp -r dashboard-api/* "${pkgdir}/srv/ai/dashboard-api/"
    install -dm755 "${pkgdir}/srv/ai/dashboard-ui"
    cp -r dashboard-ui/* "${pkgdir}/srv/ai/dashboard-ui/"

    # Install docs
    install -dm755 "${pkgdir}/srv/ai/docs"
    cp -r docs/* "${pkgdir}/srv/ai/docs/"

    # Install assets
    install -dm755 "${pkgdir}/srv/ai/assets"
    cp -r assets/* "${pkgdir}/srv/ai/assets/"

    # Create required directories
    install -dm755 "${pkgdir}/srv/ai/models"
    install -dm755 "${pkgdir}/srv/ai/backups"
    install -dm755 "${pkgdir}/srv/ai/logs"
    install -dm700 "${pkgdir}/srv/ai/dashboard-api/data"

    # Install README and LICENSE
    install -Dm644 README.md "${pkgdir}/srv/ai/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    echo ""
    echo "  >> HALO AI installed"
    echo ""
    echo "  Run the full setup:"
    echo "    /srv/ai/install.sh"
    echo ""
    echo "  This compiles all services from source (~2-3 hours)."
    echo "  The installer handles everything — just follow the prompts."
    echo ""
}

post_upgrade() {
    echo ""
    echo "  >> HALO AI upgraded to ${pkgver}"
    echo "  Restart services: sudo systemctl restart halo-*.service"
    echo ""
}
