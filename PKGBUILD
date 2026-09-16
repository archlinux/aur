# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# The Linux download of each release, as it ships: the binary with its
# themes, blocklists note and icon under /opt/sashfold — the engine looks for
# those beside the executable it was started as — a wrapper on PATH, the
# desktop entry and the icon sizes. The binary imports only libc and libm.
pkgname=sashfold-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A web browser engine written from scratch, down to its own TLS client and Wayland window"
arch=('x86_64')
url="https://sashfold.com"
license=('BSD-2-Clause')
depends=('glibc')
provides=('sashfold')
conflicts=('sashfold')
source=("sashfold-${pkgver}-linux-x64.tar.gz::https://github.com/codingncaffeine/Sashfold/releases/download/v${pkgver}/sashfold-${pkgver}-linux-x64.tar.gz")
sha256sums=('721377bf00b663713ec5424c11636d037edb72067ef0b43b76f3546d09eda802')

package() {
    local staged="${srcdir}/sashfold-${pkgver}-linux-x64"
    install -Dm755 "${staged}/sashfold" "${pkgdir}/opt/sashfold/sashfold"
    install -Dm644 "${staged}/themes/"*.json -t "${pkgdir}/opt/sashfold/themes"
    install -Dm644 "${staged}/blocklists/README.md" -t "${pkgdir}/opt/sashfold/blocklists"
    install -Dm644 "${staged}/assets/icon.png" -t "${pkgdir}/opt/sashfold/assets"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/sashfold" <<'EOF'
#!/bin/sh
exec /opt/sashfold/sashfold "$@"
EOF
    install -Dm644 "${staged}/packaging/linux/sashfold.desktop" -t "${pkgdir}/usr/share/applications"
    local size
    for size in 16 22 24 32 48 64 128 256 512; do
        install -Dm644 "${staged}/assets/icons/hicolor/${size}x${size}/apps/sashfold.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/sashfold.png"
    done
    install -Dm644 "${staged}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${staged}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
