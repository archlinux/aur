# Maintainer: Amish <contact at via dot aur>
pkgname=embridge-bin
pkgver=3.1.8.0
pkgrel=1
pkgdesc='Secure channel between network applications and keys stored in hardware tokens'
arch=(x86_64)
url='https://embridge.emudhra.com'
license=('custom')
depends=('curl' 'libunwind' 'lttng-ust2.12' 'openssl' 'icu')
source=("emBridge-${pkgver}.zip::https://resources.emudhra.com/hs/Ubuntu/latest/emBridge.zip")
sha512sums=('0fc4cd20e199eecbda93bdcb46c4b9c47b2f45334cb6810085035fa5ac3be137cd40b2f99ccf12cc157bcad5c10a63aa92b6b18bc0dd07677dcd9e5a4a2f42c3')
options=('libtool' 'staticlibs' '!strip')

package() {
    cd "${srcdir}"
    msg2 "Extracting the emBridge-v${pkgver}.deb"
    ar po "emBridge-v${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xf - --no-same-owner
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
