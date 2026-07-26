# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=ovrport-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Patch Quest games to run on Pico and other VR headsets"
arch=('x86_64')
url="https://github.com/ovrport/app"
license=('GPL-3.0-only')
depends=()
provides=('ovrport' 'overport')
conflicts=('ovrport' 'overport')
source=("${pkgname}-${pkgver}.zip::https://github.com/ovrport/app/releases/download/${pkgver}/desktop-linux.zip"
        "ovrport.desktop")
sha256sums=('497e2ca913de02a4c70763421401199313b2e782040f673e81b4f4da0239dbc7'
            '84aeba61906e77d69a15e90ef09624fa37589d9c87a77f1811e3633cfa00c38a')

package() {
    # Install to /opt
    install -dm755 "${pkgdir}/opt"
    cp -a "${srcdir}/app/overport" "${pkgdir}/opt/ovrport"
    
    # Symlink GUI binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/ovrport/bin/overport "${pkgdir}/usr/bin/ovrport"
    
    # CLI wrapper (uses bundled JRE and CLI jar)
    cat > "${pkgdir}/usr/bin/ovrport-cli" << 'EOF'
#!/bin/sh
exec /opt/ovrport/lib/runtime/bin/java -jar /opt/ovrport/lib/app/overportcli-*.jar "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/ovrport-cli"
    
    # Icon
    install -Dm644 "${pkgdir}/opt/ovrport/lib/overport.png" \
        "${pkgdir}/usr/share/pixmaps/ovrport.png"
    
    # Desktop entry
    install -Dm644 "${srcdir}/ovrport.desktop" \
        "${pkgdir}/usr/share/applications/ovrport.desktop"
}
