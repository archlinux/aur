# Maintainer: Your Name <your.email@example.com>
pkgname=goatd-kernel-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="GOATd Kernel Builder - Pure Rust + egui UI for building and managing kernels (binary release)"
arch=('x86_64')
url="https://github.com/MadGoatHaz/GOATd-Kernel"
license=('GPL-2.0+')
depends=('gcc-libs' 'glibc' 'openssl')
# Note: gcc-libs persists in depends for C runtime compatibility despite LLVM toolchain enforcement
optdepends=('modprobed-db: For modprobed-db integration support'
            'scx-scheds: For sched-ext kernel scheduler support'
            'polly: For LLVM vectorization support')
# Note: Adjust the download URL and sha256sum based on the GitHub Release artifacts
# The binary tarball should be named: goatdkernel-${pkgver}-x86_64.tar.gz
# Extract URL from: https://github.com/MadGoatHaz/GOATd-Kernel/releases/download/v${pkgver}/
source=("goatdkernel-${pkgver}-x86_64.tar.gz::https://github.com/MadGoatHaz/GOATd-Kernel/releases/download/v${pkgver}/goatdkernel-${pkgver}-x86_64.tar.gz"
        "git+https://github.com/MadGoatHaz/GOATd-Kernel.git#tag=v${pkgver}")
sha256sums=('5f95f8835b4e88d22e92004dfbed5b99b0d8911024f26515e5d1c28ed7de0266' 'ed7c6e22e9813bf7452cec32d158a58ffb188b4e9ff4461702155d0c3982da40')

package() {
    # Install binary from the downloaded tarball
    install -Dm 755 "${srcdir}/goatd_kernel" "${pkgdir}/usr/bin/goatd_kernel"
    
    # Install desktop entry from source
    cd "${srcdir}/GOATd-Kernel"
    install -Dm 644 assets/goatdkernel.desktop "${pkgdir}/usr/share/applications/goatdkernel.desktop"
    
    # Install icon
    install -Dm 644 assets/goatdkernel.svg "${pkgdir}/usr/share/pixmaps/goatdkernel.svg"
    
    # Install polkit policy
    install -Dm 644 assets/com.goatd.kernel.policy "${pkgdir}/usr/share/polkit-1/actions/com.goatd.kernel.policy"
    
    # Install documentation
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/goatdkernel/README.md"
}

# Post-install message
post_install() {
    echo "GOATd Kernel Builder has been installed!"
    echo "To run: goatd_kernel"
    echo ""
    echo "Optional dependencies for enhanced features:"
    echo "  - Install modprobed-db: yay -S modprobed-db"
    echo "  - Install scx-scheds: yay -S scx-scheds"
    echo "  - Install polly (from AUR): yay -S polly"
}

post_upgrade() {
    post_install
}
