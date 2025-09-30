# Maintainer: Marco Cadetg <cadetg@gmail.com>

pkgname=rustnet-bin
pkgver=0.11.0
pkgrel=2
pkgdesc="Real-time network monitoring TUI with process identification via eBPF and deep packet inspection"
arch=('x86_64' 'aarch64')
url="https://github.com/domcyrus/rustnet"
license=('Apache')
depends=('libpcap' 'libelf' 'zlib')
provides=("rustnet=${pkgver}")
conflicts=('rustnet')
install=rustnet-bin.install
source_x86_64=("rustnet-${pkgver}-x86_64.tar.gz::https://github.com/domcyrus/rustnet/releases/download/v${pkgver}/rustnet-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("rustnet-${pkgver}-aarch64.tar.gz::https://github.com/domcyrus/rustnet/releases/download/v${pkgver}/rustnet-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7bfd0ee505b9c2397e82e8abe28473ab9d4d65e43fbcb296913f256606487e01')
sha256sums_aarch64=('9486fd946df53032c5ffde3034a97cd8040b0a4f05abc6c44927e2aa95b37f78')

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
    
    # Create compatibility symlink for libpcap (Debian binary expects libpcap.so.0.8)
    install -dm755 "${pkgdir}/usr/lib"
    ln -sf libpcap.so.1 "${pkgdir}/usr/lib/libpcap.so.0.8"
}