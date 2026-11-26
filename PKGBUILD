# Maintainer: Christopher Brown <cjbrown102@gmail.com>
pkgname=pelagos-bin
pkgver=0.65.118
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
sha256sums_x86_64=('f26591e49db032003f1bbd50713f5aee08223f33e0110509598bdafe6e0daf4c' 'SKIP' '0ab7b444bb9d2cec43b909233b1daaa2a95e49535caa2042f65ff00cd3e50691' '8bb0a25412f420bff8ce658224f37303be2fe64fca855da4db196dd151468411')
sha256sums_aarch64=('039bb8029c7d114eaf9eae85f3d08b17691543387c58e99e18ddc43bb58173a4' 'SKIP' '0ab7b444bb9d2cec43b909233b1daaa2a95e49535caa2042f65ff00cd3e50691' '15fa4369410ef9b752cae0776d40512ec9d6b7f3a86a60331b32e79e7bff768e')

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
