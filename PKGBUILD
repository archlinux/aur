pkgname=nordvpn-git
pkgver=r34.9319a81
pkgrel=1
pkgdesc="NordVPN client for Linux (Git version)"
arch=('x86_64' 'arm64')
url="https://github.com/NordSecurity/nordvpn-linux"
license=('GPL3')
makedepends=('git' 'go' 'rust' 'mage')
depends=('iptables' 'iproute2')
provides=('nordvpn')
conflicts=('openvpn-nordvpn' 'nordvpn-bin' 'nordvpn-cli-bin')
source=("${pkgname}::git+https://github.com/NordSecurity/nordvpn-linux.git")
sha256sums=('SKIP')
install=nordvpn-git.install

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
}

build() {
    cd "${pkgname}"
    cp .env.sample .env
    mage
    mage build:binaries
}

package() {
    cd "${pkgname}"
    if [ ${CARCH} = "x86_64" ]; then
      install_arch="amd64"
    else
      install_arch="arm64"
    fi;
    install -Dm755 bin/${install_arch}/* -t "${pkgdir}/usr/bin/"
    install -Dm644 contrib/systemd/system/* -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 contrib/systemd/user/* -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm644 contrib/systemd/tmpfiles.d/* -t "${pkgdir}/usr/lib/systemd/tmpfiles.d/"
    install -Dm644 contrib/desktop/nordvpn.desktop "${pkgdir}/usr/share/applications/nordvpn.desktop"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/nordvpn/LICENSE.md"
    install -Dm644 contrib/rsa/rsa-key-1.pub "${pkgdir}/var/lib/nordvpn/data/rsa-key-1.pub"
}

