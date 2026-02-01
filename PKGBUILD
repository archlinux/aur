# Maintainer: MadGoatHaz <your-email@example.com>
pkgbase=goatd-kernel-bin
pkgname=goatdkernel
pkgver=0.2.1.2
pkgrel=1
pkgdesc="GOATd Kernel - High-performance computing platform with multi-language integration"
arch=('x86_64')
url="https://github.com/MadGoatHaz/GOATd-Kernel"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib')
makedepends=('git')
# Optimized for precompiled binary: 50 deps → 4 runtime libs (analyzed via ldd)

# The binary tarball should be named: goatdkernel-${pkgver}-x86_64.tar.gz
# Extract URL from: https://github.com/MadGoatHaz/GOATd-Kernel/releases/download/v${pkgver}/
source=("goatdkernel-${pkgver}-${pkgrel}-x86_64.tar.gz::https://github.com/MadGoatHaz/GOATd-Kernel/releases/download/v${pkgver}-${pkgrel}/goatdkernel-${pkgver}-${pkgrel}-x86_64.tar.gz"
        "git+https://github.com/MadGoatHaz/GOATd-Kernel.git#tag=v${pkgver}-${pkgrel}"
        "https://github.com/MadGoatHaz/GOATd-Kernel/releases/download/v${pkgver}-${pkgrel}/goatdkernel.png")
sha256sums=('fa48d5dd88e15e761b409e92211459989cfe773692d0bed64b4674ae8657496a' 'SKIP' 'SKIP')

package() {
    cd "${srcdir}"
    
    # Create necessary directories
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    
    # Install binaries
    if [ -f "goatd_kernel" ]; then
        install -Dm755 "goatd_kernel" "${pkgdir}/usr/bin/goatd_kernel"
    fi
    
    if [ -f "goatd-cli" ]; then
        install -Dm755 "goatd-cli" "${pkgdir}/usr/bin/goatd-cli"
    fi
    
    if [ -f "goatd-gui" ]; then
        install -Dm755 "goatd-gui" "${pkgdir}/usr/bin/goatd-gui"
    fi
    
    # Install shared libraries
    if [ -d "lib" ]; then
        cp -r lib/* "${pkgdir}/usr/lib/"
    fi
    
    # Install additional resources
    if [ -d "resources" ]; then
        cp -r resources/* "${pkgdir}/usr/share/${pkgname}/"
    fi
    
    # Install desktop entry from source
    if [ -f "${srcdir}/GOATd-Kernel/resources/goatdkernel.desktop" ]; then
        install -Dm644 "${srcdir}/GOATd-Kernel/resources/goatdkernel.desktop" "${pkgdir}/usr/share/applications/goatdkernel.desktop"
    fi
    
    # Install icon from source
    if [ -f "goatdkernel.png" ]; then
        install -Dm644 "goatdkernel.png" "${pkgdir}/usr/share/pixmaps/goatdkernel.png"
    fi
}
