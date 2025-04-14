# Maintainer: Zhoneym <Zhoneym@outlook.com>
pkgname=cri-dockerd-bin
pkgver=0.3.17
pkgrel=1
pkgdesc="A shim for using Docker as a Kubernetes container runtime"
arch=('x86_64')
url="https://github.com/Mirantis/cri-dockerd"
options=('!debug')
license=('Apache')
depends=('docker')
source=("https://github.com/Mirantis/cri-dockerd/releases/download/v${pkgver}/cri-dockerd-${pkgver}.amd64.tgz"
        "https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.service"
        "https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.socket")
sha256sums=('5568d571c2cfee7a31ce0b35b7fcc65b96c85b573ee6645151c4d022ed92a626' 'SKIP' 'SKIP')

package() {
    cd "$srcdir"

    install -Dm755 "cri-dockerd/cri-dockerd" "$pkgdir/usr/bin/cri-dockerd"

    install -Dm644 "$srcdir/cri-docker.service" "$pkgdir/usr/lib/systemd/system/cri-docker.service"
    install -Dm644 "$srcdir/cri-docker.socket" "$pkgdir/usr/lib/systemd/system/cri-docker.socket"

}

post_install() {
    systemctl enable --now docker.service
    systemctl enable --now docker.socket
    systemctl enable --now cri-docker.service
    systemctl enable --now cri-docker.socket
}

post_remove() {
    systemctl disable --now cri-docker.service
    systemctl disable --now cri-docker.socket
}
