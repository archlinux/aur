# Maintainer: Amish <contact at via dot aur>
pkgname=embridge-bin
pkgver=3.1.0.0
pkgrel=2
pkgdesc='Secure channel between network applications and keys stored in hardware tokens'
arch=(x86_64)
url='https://embridge.emudhra.com'
license=('custom')
depends=('curl' 'libunwind' 'openssl-1.0')
source=(https://resources.emudhra.com/hs/Ubuntu/latest/emBridge.zip)
sha512sums=('557fb42e3f0a1a01d91f32bbeeb1a3fc128bc44cbcea586b7b9860461d6fc75778943369b2c882b8199e01c1f951fd1381fbb6c165c851be646109b18a5ecd31')
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
}
