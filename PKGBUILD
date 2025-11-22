# Maintainer: Marco Cadetg <cadetg@gmail.com>

pkgname=rustnet-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Real-time network monitoring TUI with process identification via eBPF and deep packet inspection"
arch=('x86_64' 'aarch64')
url="https://github.com/domcyrus/rustnet"
license=('Apache-2.0')
depends=('libpcap' 'libelf' 'zlib')
provides=("rustnet=${pkgver}")
conflicts=('rustnet' 'rustnet-git')
install=rustnet-bin.install
source_x86_64=("rustnet-${pkgver}-x86_64.tar.gz::https://github.com/domcyrus/rustnet/releases/download/v${pkgver}/rustnet-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("rustnet-${pkgver}-aarch64.tar.gz::https://github.com/domcyrus/rustnet/releases/download/v${pkgver}/rustnet-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d589d753200759232bfdfbc7dec9191ad86c6fafa0f3122c873daa05b2dc152f')
sha256sums_aarch64=('c8a88f122fe5c3fb59e8f59d402d1768cdf08546959c99b223c9fcd70537cf2a')

package() {
    # Extract the archive
    tar -xzf "${srcdir}/rustnet-${pkgver}-${CARCH}.tar.gz" -C "${srcdir}"
    
    # Determine the correct directory name based on architecture
    if [ "${CARCH}" = "x86_64" ]; then
        srcdir_arch="x86_64-unknown-linux-gnu"
    elif [ "${CARCH}" = "aarch64" ]; then
        srcdir_arch="aarch64-unknown-linux-gnu"
    fi
    
    # Install binary from the extracted directory
    install -Dm755 "${srcdir}/rustnet-v${pkgver}-${srcdir_arch}/rustnet" "${pkgdir}/usr/bin/rustnet"
    
    # Install README
    install -Dm644 "${srcdir}/rustnet-v${pkgver}-${srcdir_arch}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install LICENSE  
    install -Dm644 "${srcdir}/rustnet-v${pkgver}-${srcdir_arch}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install assets (services file)
    install -Dm644 "${srcdir}/rustnet-v${pkgver}-${srcdir_arch}/assets/services" "${pkgdir}/usr/share/${pkgname}/assets/services"
    
    # Create compatibility symlink for libpcap
    install -dm755 "${pkgdir}/usr/lib"
    ln -sf libpcap.so.1 "${pkgdir}/usr/lib/libpcap.so.0.8"
}
