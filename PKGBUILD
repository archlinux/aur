# Maintainer: snapetech <slskdN@proton.me>
# 🔋 slskdN - The batteries-included Soulseek web client
pkgname=slskdn-bin
_pkgname=slskd
pkgver=0.24.1.slskdn.24
pkgrel=1
pkgdesc="🔋 The batteries-included fork of slskd. Feature-rich, including wishlist, smart ranking, tabbed browsing, notifications & more"
arch=('x86_64')
url="https://github.com/snapetech/slskdn"
license=('AGPL-3.0-or-later')
depends=()
makedepends=('unzip')
optdepends=(
    'docker: for containerized deployment'
)
provides=('slskd' 'slskd-bin')
conflicts=('slskd' 'slskd-bin' 'slskdn')
replaces=('slskd' 'slskd-bin' 'slskdn')
backup=('etc/slskd/slskd.yml')
options=('!strip')
install=slskd.install
source=(
    "https://github.com/snapetech/slskdn/releases/download/${pkgver//.slskdn/-slskdn}/slskdN-${pkgver//.slskdn/-slskdn}-linux-x64.zip"
    "slskd.service"
    "slskd.yml"
    "slskd.sysusers"
)
sha256sums=('90c3ec08ddd0d3846309872e64fc283b4090846d9a0bf3c4655439c40147c91f' 'SKIP' 'SKIP' 'SKIP')

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
