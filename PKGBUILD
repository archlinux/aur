# Maintainer: Amish <contact at via dot aur>
pkgname=embridge-bin
pkgver=3.1.9.1
pkgrel=1
pkgdesc='Secure channel between network applications and keys stored in hardware tokens'
arch=(x86_64)
url='https://embridge.emudhra.com'
license=('custom')
depends=('curl' 'libunwind' 'lttng-ust2.12' 'openssl-1.1' 'icu')
source=("emBridge-${pkgver}.zip::https://resources.emudhra.com/hs/Ubuntu/latest/emBridge.zip")
sha512sums=('526e1e522116fc348d20515ec864a664862d6759b2ebdd9b6f60927b24ac2ad0da48bf869370ddd58212dc9834b0fec04fa18340c481f884ce29cb3f32189ce0')
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
