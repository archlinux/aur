# Maintainer: snapetech <slskdn@proton.me>
# 🧪 slskdn-dev - Development build of the batteries-included Soulseek web client
# Tracks the experimental/multi-source-swarm branch with multi-source downloads & DHT mesh
pkgname=slskdn-dev
_pkgname=slskd
pkgver=0.24.1.dev.202512080436
_commit=9edf7471
pkgrel=1
pkgdesc="🧪 DEV: Batteries-included Soulseek client with multi-source downloads, DHT mesh sync, and swarm mode"
arch=('x86_64')
url="https://github.com/snapetech/slskdn/tree/experimental/multi-source-swarm"
license=('AGPL-3.0-or-later')
depends=()  # Self-contained build, no runtime deps
optdepends=(
    'docker: for containerized deployment'
)
provides=('slskd' 'slskdn')
conflicts=('slskd' 'slskd-bin' 'slskdn' 'slskdn-bin')
backup=('etc/slskd/slskd.yml')
install=slskd.install
source=(
    "slskdn-dev-linux-x64.zip::https://github.com/snapetech/slskdn/releases/download/dev/slskdn-dev-linux-x64.zip"
    "slskd.service::https://raw.githubusercontent.com/snapetech/slskdn/experimental/multi-source-swarm/packaging/aur/slskd.service"
    "slskd.yml::https://raw.githubusercontent.com/snapetech/slskdn/experimental/multi-source-swarm/packaging/aur/slskd.yml"
    "slskd.sysusers::https://raw.githubusercontent.com/snapetech/slskdn/experimental/multi-source-swarm/packaging/aur/slskd.sysusers"
)
sha256sums=('ce0eb95d193581fd3479ae651b7d00d2b901e4e574810042fae7bfdb64906262' 'SKIP' 'SKIP' 'SKIP')

package() {
    # Install application to /usr/lib/slskd
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    cp -r "${srcdir}"/* "${pkgdir}/usr/lib/${_pkgname}/"
    
    # Remove non-application files that were extracted
    rm -f "${pkgdir}/usr/lib/${_pkgname}/slskd.service"
    rm -f "${pkgdir}/usr/lib/${_pkgname}/slskd.yml"
    rm -f "${pkgdir}/usr/lib/${_pkgname}/slskd.sysusers"
    
    # Make binary executable
    chmod +x "${pkgdir}/usr/lib/${_pkgname}/slskd"
    
    # Create symlink /usr/bin/slskd -> /usr/lib/slskd/slskd
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${_pkgname}/slskd" "${pkgdir}/usr/bin/${_pkgname}"
    
    # Install systemd service
    install -Dm644 "${srcdir}/slskd.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    
    # Install sysusers config
    install -Dm644 "${srcdir}/slskd.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    
    # Install default config
    install -Dm644 "${srcdir}/slskd.yml" "${pkgdir}/etc/${_pkgname}/${_pkgname}.yml"
    
    # Create data directories
    install -dm755 "${pkgdir}/var/lib/${_pkgname}"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/downloads"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/incomplete"
}

