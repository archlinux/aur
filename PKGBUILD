# Maintainer: Stefan Zipproth <s.zipproth@acrion.ch>

pkgname=wayland-display-info
pkgver=1.0.5
pkgrel=1
pkgdesc="Daemon that keeps /var/cache/wayland-display-info/display-info up to date using wlr-output-management"
arch=('any')
url="https://github.com/acrion/wayland-display-info"
license=('AGPL3')
depends=('systemd')
makedepends=('wayland' 'gcc' 'pkgconf' 'wlr-protocols' 'git')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    ./generate-protocol-stubs.sh
    ./build.sh
}

package() {
    cd "${pkgname}-${pkgver}"
    
    # Install binary
    install -Dm755 "wayland-display-info" "${pkgdir}/usr/lib/${pkgname}/wayland-display-info"
    
    # Install systemd user service
    install -Dm644 "wayland-display-info.service" "${pkgdir}/usr/lib/systemd/user/wayland-display-info.service"
    
    # Install tmpfiles configuration
    install -Dm644 "wayland-display-info.conf" "${pkgdir}/usr/lib/tmpfiles.d/wayland-display-info.conf"
    
    # Install man page
    install -Dm644 "wayland-display-info.1" "${pkgdir}/usr/share/man/man1/wayland-display-info.1"
    
    # Install documentation
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
