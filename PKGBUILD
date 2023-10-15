pkgname=nordvpn-git
pkgver=r179.cd9e0ff
pkgrel=1
pkgdesc="NordVPN client for Linux (Git version)"
arch=('x86_64' 'arm64')
url="https://github.com/NordSecurity/nordvpn-linux"
license=('GPL3')
makedepends=('git' 'go' 'rust' 'mage' 'docker')
depends=('iptables' 'iproute2' 'openvpn')
provides=('nordvpn')
conflicts=('openvpn-nordvpn' 'nordvpn-bin' 'nordvpn-cli-bin')
# source=("${pkgname}::git+https://github.com/NordSecurity/nordvpn-linux.git")
# sha256sums=('SKIP')
install=nordvpn-git.install

pkgver() {
    cd nordvpn-linux
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    if ! $(groups | grep -q '\bdocker\b'); then
   	echo "You are not a member of the docker group. Docker is required to build the package."
        exit 1
    fi

    if ! [ -d nordvpn-linux ]; then
        git clone https://github.com/NordSecurity/nordvpn-linux
        cd nordvpn-linux
    else
        cd nordvpn-linux
        git pull origin main
    fi;
}

build() {
    cd nordvpn-linux
    cp .env.sample .env
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    mage build:binariesDocker
    mage build:openvpnDocker
}

package() {
    cd nordvpn-linux
    if [ ${CARCH} = "x86_64" ]; then
      install_arch="amd64"
    else
      install_arch="arm64"
    fi;
    install -Dm755 bin/${install_arch}/* -t "${pkgdir}/usr/bin/"
    install -Dm755 bin/deps/openvpn/${install_arch}/*/openvpn -t "${pkgdir}/var/lib/nordvpn/"
    install -Dm644 contrib/systemd/system/* -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 contrib/systemd/user/* -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm644 contrib/systemd/tmpfiles.d/* -t "${pkgdir}/usr/lib/systemd/tmpfiles.d/"
    install -Dm644 contrib/desktop/nordvpn.desktop "${pkgdir}/usr/share/applications/nordvpn.desktop"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/nordvpn/LICENSE.md"
    install -Dm644 contrib/rsa/rsa-key-1.pub "${pkgdir}/var/lib/nordvpn/data/rsa-key-1.pub"
}

