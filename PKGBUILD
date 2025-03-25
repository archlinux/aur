# Maintainer: Your Name <your.email@example.com>
pkgname=cri-dockerd-bin
pkgver=0.3.16
pkgrel=1
pkgdesc="A shim for using Docker as a Kubernetes container runtime"
arch=('x86_64')
url="https://github.com/Mirantis/cri-dockerd"
license=('Apache')
depends=('docker')
source=("https://github.com/Mirantis/cri-dockerd/releases/download/v${pkgver}/cri-dockerd-${pkgver}.amd64.tgz"
        "https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.service"
        "https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.socket")
sha256sums=('cc7f181ce850130dc375515c54cd8a27e1e862252abc5b7eade7b4a03ddabd8e' 'SKIP' 'SKIP')

package() {
    cd "$srcdir"

    install -Dm755 "cri-dockerd/cri-dockerd" "$pkgdir/usr/bin/cri-dockerd"

    install -Dm644 "$srcdir/cri-docker.service" "$pkgdir/usr/lib/systemd/system/cri-docker.service"
    install -Dm644 "$srcdir/cri-docker.socket" "$pkgdir/usr/lib/systemd/system/cri-docker.socket"

}

post_install() {
    systemctl enable --now cri-docker.service
    systemctl enable --now cri-docker.socket
}

post_remove() {
    systemctl disable --now cri-docker.service
    systemctl disable --now cri-docker.socket
}
