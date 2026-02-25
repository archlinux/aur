# Maintainer: Roland Kiraly <rolandgyulakiraly at outlook dot com>
# https://github.com/raverecursion/nordlayer-latest/tree/master
pkgname=nordlayer
pkgver=3.4.3
pkgrel=2
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64')
url="https://nordlayer.com"
license=('custom:commercial')
replaces=('nordvpnteams-bin')
conflicts=('nordvpnteams-bin')
depends=('bash' 'libgcrypt' 'libgpg-error' 'libcap' 'hicolor-icon-theme' 'gmp' 'strongswan')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://downloads.nordlayer.com/linux/latest/debian/pool/main/nordlayer_${pkgver}_amd64.deb")
sha512sums_x86_64=('578d43c80ab3fdb658faab6e538edfb136700fb10e6a355c41c6996f1ae4056ac8dd4fc5e660c9acd3e009f9290840e4772c572591b38c0f03a83a97ae2b3a4e')

package() {
    cd "${srcdir}"
    # Extract the control and data tarballs from the .deb file
    ar x "${srcdir}/nordlayer_${pkgver}_amd64.deb"

    # Extract the data.tar.gz into the pkgdir
    tar -xzf data.tar.gz -C "${pkgdir}"

    # Move sbin binaries to bin
    if [ -d "${pkgdir}/usr/sbin" ]; then
        mv "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"
        # Update the systemd service file to point to /usr/bin instead of /usr/sbin
        sed -i 's+/usr/sbin+/usr/bin+g' "${pkgdir}/usr/lib/systemd/system/nordlayer.service"
        # Remove the now-empty sbin directory
        rm -r "${pkgdir}/usr/sbin"
    fi
}
