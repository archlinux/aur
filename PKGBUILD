# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=nexus-virt
pkgver=0.5.5
pkgrel=1
pkgdesc='Lightweight VM lifecycle daemon for containerd and Kata Containers'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Nexus'
license=('GPL-3.0-or-later')
depends=('containerd' 'cni-plugins-bin' 'coredns' 'kata-all-bin')
makedepends=('go')
install=nexus-virt.install
backup=('etc/kata-containers/configuration.toml')

_node_exporter_ver=1.10.2
_anvil_kernel_ver=6.19.6

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://github.com/prometheus/node_exporter/releases/download/v${_node_exporter_ver}/node_exporter-${_node_exporter_ver}.linux-amd64.tar.gz"
             "https://github.com/Work-Fort/Anvil/releases/download/v${_anvil_kernel_ver}/vmlinux-${_anvil_kernel_ver}-x86_64.xz")
source_aarch64=("https://github.com/prometheus/node_exporter/releases/download/v${_node_exporter_ver}/node_exporter-${_node_exporter_ver}.linux-arm64.tar.gz"
              "https://github.com/Work-Fort/Anvil/releases/download/v${_anvil_kernel_ver}/Image-${_anvil_kernel_ver}-aarch64.xz")
noextract=("vmlinux-${_anvil_kernel_ver}-x86_64.xz"
           "Image-${_anvil_kernel_ver}-aarch64.xz")
sha256sums=('83738c0010a8dd4d3d4ad27af7a9cc4045261ae37b48b66322831181f031017d')
sha256sums_x86_64=('c46e5b6f53948477ff3a19d97c58307394a29fe64a01905646f026ddc32cb65b'
                   '6f12bb335921fdc1334c288e52ad7cbf60c10ceabc6a0d0c8ad10f55d66eadef')
sha256sums_aarch64=('de69ec8341c8068b7c8e4cfe3eb85065d24d984a3b33007f575d307d13eb89a6'
                    '57b59b4a290bd8cf5ba3cb768989c851ed1e5dcbabdc155c02cdb1c1ca6155d2')

prepare() {
    if [[ "$CARCH" == "x86_64" ]]; then
        xz -dk --force "${srcdir}/vmlinux-${_anvil_kernel_ver}-x86_64.xz"
    else
        xz -dk --force "${srcdir}/Image-${_anvil_kernel_ver}-aarch64.xz"
    fi
}

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
    install -dm750 "${pkgdir}/etc/polkit-1/rules.d"
    install -m644 dist/49-nexus-resolved.rules "${pkgdir}/etc/polkit-1/rules.d/49-nexus-resolved.rules"

    # node_exporter from upstream Prometheus release (strip debug symbols to
    # avoid debugedit warnings from makepkg).
    install -Dm755 "${srcdir}/node_exporter-${_node_exporter_ver}.linux-"*/node_exporter "${pkgdir}/usr/bin/node_exporter"
    strip "${pkgdir}/usr/bin/node_exporter"

    # Anvil guest kernel for Kata Containers.
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm644 "${srcdir}/vmlinux-${_anvil_kernel_ver}-x86_64" "${pkgdir}/usr/share/nexus/vmlinux"
    else
        install -Dm644 "${srcdir}/Image-${_anvil_kernel_ver}-aarch64" "${pkgdir}/usr/share/nexus/vmlinux"
    fi

    # Kata config override pointing to the Anvil kernel.
    install -Dm644 "${srcdir}/Nexus-${pkgver}/dist/kata-configuration.toml" "${pkgdir}/etc/kata-containers/configuration.toml"
}
