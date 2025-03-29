# Maintainer: Amish <contact at via dot aur>
pkgname=embridge-bin
pkgver=3.3.0.2
pkgrel=1
pkgdesc='emBridge Service to access crypto tokens'
arch=(x86_64)
url='https://embridge.emudhra.com'
license=('custom')
depends=('ca-certificates' 'curl' 'libunwind' 'lttng-ust2.12' 'numactl' 'openssl' 'icu')
source=("emBridge-${pkgver}.zip::https://resources.emudhra.com/hs/Ubuntu/latest/emBridge.zip")
sha512sums=('0f053fddabb8b17b4e23bee2be6f06597294af7a4ea05255ec6b894968d6af8b2a75b7b31012d4b1ddcbb5515d79823301a03e74d8e3bfb72dcd74c2cf1aa542')
options=('!debug' 'libtool' 'staticlibs' '!strip')

package() {
    cd "${srcdir}"
    msg2 "Extracting the emBridge-v${pkgver}.deb"
    ar po "emBridge-v${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xf - --no-same-owner
    find "${pkgdir}/opt" -type d -exec chmod 755 {} \+
    cd "${pkgdir}/opt/eMudhra/emBridge"
    find . -type f -exec chmod 644 {} \+
    find . -name '*.dll' -exec chmod 755 {} \+
#    find . -name '*.sh' -exec chmod 755 {} \+
    find . -name '*.so' -exec chmod 755 {} \+
    chmod 755 createdump emBridge
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/embridge" << 'EOF'
#!/bin/bash
mkdir -p ~/Documents/embridge
cd ~/Documents/embridge
export ASPNETCORE_ENVIRONMENT="Production"
export ASPNETCORE_HTTPS_PORT=26769
export ASPNETCORE_URLS="https://localhost.emudhra.com:26769"
export CLR_ICU_VERSION_OVERRIDE=$(icu-config --version)
/opt/eMudhra/emBridge/emBridge
EOF
}
