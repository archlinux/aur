# Maintainer: Marco Cadetg <cadetg@gmail.com>

pkgname=rustnet-bin
pkgver=1.0.0
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
sha256sums_x86_64=('9d09eadf97c08e5053324837c94b597fb6351c4d2ebcb0b1a443158fc1ba6781')
sha256sums_aarch64=('7f2e636bf4e7843628713f2dec4adc09ec49508c039af460007e9b0321897082')

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
