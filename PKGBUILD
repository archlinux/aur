# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=nexus-virt
pkgver=0.1.0
pkgrel=1
pkgdesc='Lightweight VM lifecycle daemon for containerd and Kata Containers'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Nexus'
license=('GPL-3.0-or-later')
depends=('containerd' 'cni-plugins-bin' 'coredns' 'kata-all-bin')
makedepends=('go')
install=nexus-virt.install

_node_exporter_ver=1.10.2

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://github.com/prometheus/node_exporter/releases/download/v${_node_exporter_ver}/node_exporter-${_node_exporter_ver}.linux-amd64.tar.gz")
source_aarch64=("https://github.com/prometheus/node_exporter/releases/download/v${_node_exporter_ver}/node_exporter-${_node_exporter_ver}.linux-arm64.tar.gz")
sha256sums=('199c138cfe735be52054e4e09b28a897c1e0df9fc62d4b40adb411f60db05bec')
sha256sums_x86_64=('c46e5b6f53948477ff3a19d97c58307394a29fe64a01905646f026ddc32cb65b')
sha256sums_aarch64=('de69ec8341c8068b7c8e4cfe3eb85065d24d984a3b33007f575d307d13eb89a6')

build() {
    cd "Nexus-${pkgver}"
    export CGO_ENABLED=0
    _ver="${pkgver}-aur"
    go build -trimpath -ldflags "-s -w -X github.com/Work-Fort/Nexus/cmd.Version=${_ver}" -o nexus
    go build -trimpath -ldflags "-s -w -X main.Version=${_ver}" -o nexusctl ./cmd/nexusctl/
    go build -trimpath -ldflags "-s -w" -o nexus-netns ./cmd/nexus-netns/
    go build -trimpath -ldflags "-s -w" -o nexus-cni-exec ./cmd/nexus-cni-exec/
    go build -trimpath -ldflags "-s -w" -o nexus-quota ./cmd/nexus-quota/
    go build -trimpath -ldflags "-s -w" -o nexus-btrfs ./cmd/nexus-btrfs/
    go build -trimpath -ldflags "-s -w" -o nexus-dns ./cmd/nexus-dns/
}

package() {
    cd "Nexus-${pkgver}"
    install -Dm755 nexus "${pkgdir}/usr/bin/nexus"
    install -Dm755 nexusctl "${pkgdir}/usr/bin/nexusctl"
    install -Dm755 nexus-netns "${pkgdir}/usr/bin/nexus-netns"
    install -Dm755 nexus-cni-exec "${pkgdir}/usr/bin/nexus-cni-exec"
    install -Dm755 nexus-quota "${pkgdir}/usr/bin/nexus-quota"
    install -Dm755 nexus-btrfs "${pkgdir}/usr/bin/nexus-btrfs"
    install -Dm755 nexus-dns "${pkgdir}/usr/bin/nexus-dns"
    install -Dm644 dist/nexus.service "${pkgdir}/usr/lib/systemd/user/nexus.service"

    # node_exporter from upstream Prometheus release (strip debug symbols to
    # avoid debugedit warnings from makepkg).
    install -Dm755 "${srcdir}/node_exporter-${_node_exporter_ver}.linux-"*/node_exporter "${pkgdir}/usr/bin/node_exporter"
    strip "${pkgdir}/usr/bin/node_exporter"
}
