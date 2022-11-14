# Maintainer: Amish <contact at via dot aur>
pkgname=embridge-bin
pkgver=3.1.7.0
pkgrel=3
pkgdesc='Secure channel between network applications and keys stored in hardware tokens'
arch=(x86_64)
url='https://embridge.emudhra.com'
license=('custom')
depends=('curl' 'libunwind' 'openssl')
source=("emBridge-${pkgver}.zip::https://resources.emudhra.com/hs/Ubuntu/latest/emBridge.zip"
        "runtimeconfig.patch")
sha512sums=('cb29bafd903768194f2bf03d3c56286b97891403792dfca4b790b8841640e869b46d94514f710f7f1138871f08d2815c5946156ede38d0a107b7197dc5f5e5fc'
            '566fdfceb9c53614b30f4ba7851f5a9de502e9cfa1e45ed7b1a804d1c6112f25944a302ba07e89f05815acb580952aed3932a81c66dd0141c1913e7d56390309')
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
/opt/eMudhra/emBridge/emBridge
EOF
    patch -p0 -d "${pkgdir}" -i "${srcdir}"/runtimeconfig.patch
}
