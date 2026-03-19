# Maintainer: snapetech <slskdn@proton.me>
# 🔋 slskdn - The batteries-included Soulseek web client
pkgname=slskdn-bin
_pkgname=slskd
pkgver=0.24.5.slskdn.72
pkgrel=1
pkgdesc="🔋 The batteries included fork of slskd with 24+ new features: decentralized pods, content validation, swarm downloads, DHT mesh networking, auto-replace, wishlist, security hardening."
arch=('x86_64')
url="https://github.com/snapetech/slskdn"
license=('AGPL-3.0-or-later')
depends=()
makedepends=('unzip')
optdepends=(
    'docker: for containerized deployment'
)
provides=('slskd' 'slskd-bin')
conflicts=('slskd' 'slskd-bin' 'slskdN')
replaces=('slskd' 'slskd-bin' 'slskdN')
backup=('etc/slskd/slskd.yml')
options=('!strip')
install=slskd.install
source=(
    "slskdn-${pkgver}-linux-x64.zip::https://github.com/snapetech/slskdn/releases/download/${pkgver//.slskdn/-slskdn}/slskdn-main-linux-x64.zip"
    "slskd.service"
    "slskd.yml"
    "slskd.sysusers"
)
# Note: First hash is SKIP (zip changes each release), others are static file hashes
sha256sums=('37258a03f7ad2dbfaa836eeacf778a9e9f9654e570799da48d14423bc0b3aa5d' 'e86287085cd17a5db39c6498b6d25ebdc194bca552f678aa8c749b7c25293249' 'a170afada9ec8673ab696506756e1b5d971ee4f67560af795f359c9bd53645df' '28b6c2c8d969a91bc8b5ae3e7289562928fff39ed07b92973e5b93fa45033056')

package() {
    # Install application to /usr/lib/slskd (same location as original slskd)
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    
    # Copy all files from zip except our packaging files
    for f in "${srcdir}"/*; do
        fname=$(basename "$f")
        case "$fname" in
            slskd.service|slskd.yml|slskd.sysusers|*.zip)
                continue
                ;;
            *)
                cp -r "$f" "${pkgdir}/usr/lib/${_pkgname}/"
                ;;
        esac
    done
    
    # Make binary executable
    chmod +x "${pkgdir}/usr/lib/${_pkgname}/slskd"
    
    # Create symlink /usr/bin/slskd -> /usr/lib/slskd/slskd
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${_pkgname}/slskd" "${pkgdir}/usr/bin/${_pkgname}"
    
    # Install systemd service as slskd.service
    install -Dm644 "${srcdir}/slskd.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    
    # Install sysusers config
    install -Dm644 "${srcdir}/slskd.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    
    # Install default config to /etc/slskd/slskd.yml (only if not exists - backup handles upgrades)
    install -Dm644 "${srcdir}/slskd.yml" "${pkgdir}/etc/${_pkgname}/${_pkgname}.yml"
    
    # Create data directories at /var/lib/slskd
    install -dm755 "${pkgdir}/var/lib/${_pkgname}"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/downloads"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/incomplete"
}
