# Maintainer: snapetech <snapetech@github.com>
pkgname=slskdn-bin
_pkgname=slskdn
pkgver=0.24.1.slskdn.3
pkgrel=1
pkgdesc="A modern client-server application for the Soulseek file sharing network (enhanced fork) - binary release"
arch=('x86_64')
url="https://github.com/snapetech/slskdn"
license=('AGPL-3.0-or-later')
depends=('dotnet-runtime-8.0' 'aspnet-runtime-8.0')
optdepends=(
    'docker: for containerized deployment'
)
provides=('slskd' 'slskdn')
conflicts=('slskd' 'slskdn')
backup=('etc/slskdn/slskdn.yml')
source=(
    "https://github.com/snapetech/slskdn/releases/download/${pkgver//.slskdn/-slskdn}/slskdn-${pkgver//.slskdn/-slskdn}-linux-x64.tar.gz"
    "slskdn.service"
    "slskdn.yml"
    "slskdn.sysusers"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    # Install application
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    cp -r "${srcdir}/slskdn-${pkgver//.slskdn/-slskdn}-linux-x64/"* "${pkgdir}/usr/lib/${_pkgname}/"
    
    # Create wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" << 'WRAPPER'
#!/bin/bash
exec /usr/lib/slskdn/slskd "$@"
WRAPPER
    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
    
    # Install systemd service
    install -Dm644 "${srcdir}/slskdn.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    
    # Install sysusers config
    install -Dm644 "${srcdir}/slskdn.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    
    # Install default config
    install -Dm644 "${srcdir}/slskdn.yml" "${pkgdir}/etc/${_pkgname}/slskdn.yml"
    
    # Create data directories
    install -dm755 "${pkgdir}/var/lib/${_pkgname}"
}
