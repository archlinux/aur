# Maintainer: stampby <stampby@users.noreply.github.com>
# "I know kung fu." — Neo, The Matrix

pkgname=halo-ai-core
pkgver=0.9.0
pkgrel=1
pkgdesc="Bare-metal AI stack installer for AMD Strix Halo (gfx1151) — ROCm, llama.cpp, Lemonade SDK, Gaia SDK, Caddy"
arch=('x86_64')
url="https://github.com/stampby/halo-ai-core"
license=('MIT')
depends=(
    'openssh'
    'curl'
    'wget'
    'cmake'
    'make'
    'nodejs'
    'npm'
    'caddy'
    'rocm-hip-sdk'
    'rocm-opencl-sdk'
    'hip-runtime-amd'
    'rocminfo'
    'rocwmma'
    'vulkan-headers'
    'vulkan-icd-loader'
    'vulkan-radeon'
)
makedepends=('git')
provides=("${pkgname}")
conflicts=('halo-ai')
source=("${pkgname}::git+https://github.com/stampby/halo-ai-core.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    grep '^VERSION=' install.sh | head -1 | sed 's/VERSION="//;s/"//'
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install main directory to /usr/share/halo-ai-core
    install -dm755 "${pkgdir}/usr/share/${pkgname}"

    # Install the main entry point
    install -Dm755 install.sh "${pkgdir}/usr/share/${pkgname}/install.sh"

    # Install assets
    if [ -d assets ]; then
        install -dm755 "${pkgdir}/usr/share/${pkgname}/assets"
        cp -a assets/* "${pkgdir}/usr/share/${pkgname}/assets/"
    fi

    # Install configs if present
    if [ -d configs ]; then
        cp -a configs "${pkgdir}/usr/share/${pkgname}/"
    fi

    # Install scripts if present
    if [ -d scripts ]; then
        cp -a scripts "${pkgdir}/usr/share/${pkgname}/"
    fi

    # Install sites if present
    if [ -d sites ]; then
        cp -a sites "${pkgdir}/usr/share/${pkgname}/"
    fi

    # Install systemd units if present
    if [ -d systemd ]; then
        cp -a systemd "${pkgdir}/usr/share/${pkgname}/"
    fi

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install docs
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

    # Create symlink: /usr/bin/halo-ai-core -> /usr/share/halo-ai-core/install.sh
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/install.sh" "${pkgdir}/usr/bin/${pkgname}"
}
