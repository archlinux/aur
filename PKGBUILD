pkgname=nordvpn
pkgver=3.17.0
pkgrel=1
pkgdesc="NordVPN client for Linux"
arch=('x86_64' 'arm64')
url="https://github.com/NordSecurity/nordvpn-linux"
license=('GPL3')
makedepends=('go' 'mage' 'docker')
depends=('iptables' 'iproute2' 'wireguard-tools')
provides=('nordvpn')
conflicts=('openvpn-nordvpn' 'nordvpn-bin' 'nordvpn-cli-bin' 'nordvpn-git')
source=("https://github.com/NordSecurity/nordvpn-linux/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('27e547b46767696afcb9b5e0a91c92977a1380bd29972e3d4315de896682c43b')
install=nordvpn.install

prepare() {
    if ! $(groups | grep -q '\bdocker\b'); then
   	echo "You are not a member of the docker group. Docker is required to build the package."
        exit 1
    fi
    bsdtar -xf "${pkgver}.tar.gz"
    cd "nordvpn-linux-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/../ci_env.sh.patch"
    # patch --forward --strip=1 --input="${srcdir}/../ci_compile.sh.patch"
    patch --forward --strip=1 --input="${srcdir}/../magefiles_scripts.go.patch"
}

build() {
    cd "nordvpn-linux-${pkgver}"
    cp .env.sample .env
    export pkgver=${pkgver}
    export ENVIRONMENT="prod"
    export VERSION=${pkgver}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    mage build:binariesDocker
    mage build:openvpnDocker
}

package() {
    cd "nordvpn-linux-${pkgver}"
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

