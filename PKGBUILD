# Maintainer: Christopher Brown <cjbrown102@gmail.com>
pkgname=pelagos-bin
pkgver=0.65.117
pkgrel=1
pkgdesc="Fast Linux container runtime — OCI-compatible, namespaces, cgroups v2, seccomp, networking, image management (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/pelagos-containers/pelagos"
license=('Apache-2.0')
provides=('pelagos')
conflicts=('pelagos')
depends=('nftables' 'iproute2')
optdepends=(
    'passt: rootless networking (pelagos run without sudo)'
    'fuse-overlayfs: rootless overlay filesystem on kernels < 5.11'
    'dnsmasq: production-grade DNS backend for container name resolution'
)
install=$pkgname.install
source_x86_64=("pelagos-x86_64::https://github.com/pelagos-containers/pelagos/releases/download/v$pkgver/pelagos-x86_64-linux"
               "pelagos-x86_64.sha256::https://github.com/pelagos-containers/pelagos/releases/download/v$pkgver/pelagos-x86_64-linux.sha256"
               "pelagos-$pkgver-src.tar.gz::https://github.com/pelagos-containers/pelagos/archive/refs/tags/v$pkgver.tar.gz"
               "pelagos-cri-x86_64::https://github.com/pelagos-containers/pelagos/releases/download/v$pkgver/pelagos-cri-x86_64-linux")
source_aarch64=("pelagos-aarch64::https://github.com/pelagos-containers/pelagos/releases/download/v$pkgver/pelagos-aarch64-linux"
                "pelagos-aarch64.sha256::https://github.com/pelagos-containers/pelagos/releases/download/v$pkgver/pelagos-aarch64-linux.sha256"
                "pelagos-$pkgver-src.tar.gz::https://github.com/pelagos-containers/pelagos/archive/refs/tags/v$pkgver.tar.gz"
                "pelagos-cri-aarch64::https://github.com/pelagos-containers/pelagos/releases/download/v$pkgver/pelagos-cri-aarch64-linux")
sha256sums_x86_64=('7eb561aa1a841ca87a8bd5d9e32a1bca82858207f62119f6b0b110cb1c5ec1bc' 'SKIP' 'c1bee900858a750078db3afbee3f68a59d111073d56373f1f6766a4c38e4de90' 'edaa0f5942445411a3b91d202c356f1f403a2e45bbe5d987cd8e60a0d32b9a32')
sha256sums_aarch64=('92afe95c9c3f511c557b0feb3992d081109f8c7c00123a5a4523f56576eb5f6a' 'SKIP' 'c1bee900858a750078db3afbee3f68a59d111073d56373f1f6766a4c38e4de90' '30362cdfe0ddc24281a140e93de024dbb03a2623ee47e23256157040497341d3')

package() {
    # Install the pre-built binary.
    install -Dm755 "pelagos-${CARCH}" "$pkgdir/usr/bin/pelagos"

    # The release currently ships a single combined binary; pelagos-dns and the
    # wasm shim are built separately in the source package.  Extract them from
    # the source tarball so the -bin package is complete.
    # (Once the release workflow uploads them as separate artifacts this can be
    # simplified to direct binary installs.)
    local _srcdir="pelagos-$pkgver"

    # CRI server (separate release artifact) + shim-handler support files.
    install -Dm755 "pelagos-cri-${CARCH}" "$pkgdir/usr/bin/pelagos-cri"
    install -Dm755 "$_srcdir/scripts/pelagos-cri-shim-handlers.sh" "$pkgdir/usr/bin/pelagos-cri-shim-handlers"
    install -Dm644 "$_srcdir/pkg/nfpm/pelagos-cri.service" "$pkgdir/usr/lib/systemd/system/pelagos-cri.service"
    install -Dm644 "$_srcdir/pkg/nfpm/cri.env.example" "$pkgdir/usr/share/pelagos/cri.env.example"
    install -Dm644 "$_srcdir/pkg/runtimeclass/kata.yaml" "$pkgdir/usr/share/pelagos/runtimeclass/kata.yaml"
    install -Dm644 "$_srcdir/pkg/runtimeclass/gvisor.yaml" "$pkgdir/usr/share/pelagos/runtimeclass/gvisor.yaml"
    install -Dm644 "$_srcdir/docs/SHIM_HANDLERS_GUIDE.md" "$pkgdir/usr/share/doc/$pkgname/SHIM_HANDLERS_GUIDE.md"

    # License and docs from source tarball.
    install -Dm644 "$_srcdir/LICENSE"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$_srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Post-install setup script.
    install -Dm755 "$_srcdir/scripts/setup.sh" "$pkgdir/usr/share/pelagos/setup.sh"

    # systemd-tmpfiles: ensure /run/pelagos exists on boot.
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/pelagos.conf" <<EOF
d /run/pelagos 0755 root root -
EOF
}
