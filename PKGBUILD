# Maintainer: Roland Kiraly <rolandgyulakiraly at outlook dot com>
# https://github.com/rolki-png/nordlayer-latest/tree/master
pkgname=nordlayer
pkgver=3.6.0
pkgrel=3
pkgdesc="Proprietary secure network access client for Linux"
arch=('x86_64')
url="https://nordlayer.com"
license=('custom:commercial')
replaces=('nordvpnteams-bin')
conflicts=('nordvpnteams-bin' 'nordlayer-bin')
depends=('bash' 'hicolor-icon-theme' 'libcap' 'libcap-ng')
backup=('etc/default/nordlayer' 'etc/nordlayer/config.hcl')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://downloads.nordlayer.com/linux/latest/debian/pool/main/nordlayer_${pkgver}_amd64.deb")
sha256sums_x86_64=('037ff798826c3a453bd77b2ccd1e811c280a4205347a4a41a4f97791c3a3a9d2')

package() {
    bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

    # Move sbin binaries to bin
    if [ -d "${pkgdir}/usr/sbin" ]; then
        mv "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"
        # Update the systemd service file to point to /usr/bin instead of /usr/sbin
        sed -i 's+/usr/sbin+/usr/bin+g' "${pkgdir}/usr/lib/systemd/system/nordlayer.service"
        # Remove the now-empty sbin directory
        rm -r "${pkgdir}/usr/sbin"
    fi

    # NordLayer's postinst installs this drop-in only on systemd >= 255.
    # Every Arch system qualifies, so the package ships it as an owned file.
    install -Dm644 "${pkgdir}/usr/libexec/nordlayer/nordlayerd-seccomp.conf" \
        "${pkgdir}/usr/lib/systemd/system/nordlayer.service.d/10-seccomp.conf"

    # Debian's apt source and signing key do nothing on Arch.
    rm -rf "${pkgdir}/etc/apt" "${pkgdir}/usr/share/keyrings"
}
