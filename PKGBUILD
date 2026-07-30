# Maintainer: forgezhzh <forgezhzh@outlook.com>
pkgname=cri-dockerd-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="A shim for using Docker as a Kubernetes container runtime"
arch=('x86_64' 'aarch64')
url="https://github.com/Mirantis/cri-dockerd"
options=('!debug')
license=('Apache')
depends=('docker')
source_x86_64=(
    "https://github.com/Mirantis/cri-dockerd/releases/download/v${pkgver}/cri-dockerd-${pkgver}.amd64.tgz"
)

source_aarch64=(
    "https://github.com/Mirantis/cri-dockerd/releases/download/v${pkgver}/cri-dockerd-${pkgver}.arm64.tgz"
)

source=(
    "cri-docker.service::https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.service"
    "cri-docker.socket::https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.socket"
)

sha256sums_x86_64=(
    '109b7540053a507dd85ad7b9fee9cee9caae55feedcc28365d3e7ab4fb2172d5'
)

sha256sums_aarch64=(
    '4f96b4e9b7fcb1c90f78470325c2197a67fa28c0e0c901509437b791f5588a37'
)

sha256sums=(
    'SKIP'
    'SKIP'
)

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
