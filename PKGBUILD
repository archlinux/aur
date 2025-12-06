# Maintainer: snapetech <snapetech@github.com>
pkgname=slskdn
pkgver=0.24.1.slskdn.3
pkgrel=1
pkgdesc="A modern client-server application for the Soulseek file sharing network (enhanced fork)"
arch=('x86_64' 'aarch64')
url="https://github.com/snapetech/slskdn"
license=('AGPL-3.0-or-later')
depends=('dotnet-runtime-8.0' 'aspnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0' 'nodejs' 'npm')
optdepends=(
    'docker: for containerized deployment'
)
provides=('slskd')
conflicts=('slskd')
backup=('etc/slskdn/slskdn.yml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snapetech/slskdn/archive/refs/tags/${pkgver//.slskdn/-slskdn}.tar.gz")
sha256sums=('SKIP')

pkgver() {
    echo "${pkgver}"
}

build() {
    cd "${srcdir}/slskdn-${pkgver//.slskdn/-slskdn}"
    
    # Build frontend
    cd src/web
    npm ci
    npm run build
    cd ../..
    
    # Build backend
    dotnet publish src/slskd/slskd.csproj \
        -c Release \
        -o publish \
        --self-contained false \
        -r linux-x64
}

package() {
    cd "${srcdir}/slskdn-${pkgver//.slskdn/-slskdn}"
    
    # Install application
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r publish/* "${pkgdir}/usr/lib/${pkgname}/"
    
    # Install web assets
    install -dm755 "${pkgdir}/usr/lib/${pkgname}/wwwroot"
    cp -r src/web/build/* "${pkgdir}/usr/lib/${pkgname}/wwwroot/"
    
    # Create wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'WRAPPER'
#!/bin/bash
exec /usr/lib/slskdn/slskd "$@"
WRAPPER
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
    
    # Install systemd service
    install -Dm644 "${srcdir}/slskdn.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    
    # Install default config
    install -Dm644 "${srcdir}/slskdn.yml" "${pkgdir}/etc/${pkgname}/slskdn.yml"
    
    # Create data directories
    install -dm755 "${pkgdir}/var/lib/${pkgname}"
    install -dm755 "${pkgdir}/var/lib/${pkgname}/downloads"
    install -dm755 "${pkgdir}/var/lib/${pkgname}/incomplete"
}
