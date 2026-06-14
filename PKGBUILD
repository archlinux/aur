# Maintainer: Christopher Brown <cjbrown102@gmail.com>
pkgname=pelagos-bin
pkgver=0.65.33
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
               "pelagos-$pkgver-src.tar.gz::https://github.com/pelagos-containers/pelagos/archive/refs/tags/v$pkgver.tar.gz")
source_aarch64=("pelagos-aarch64::https://github.com/pelagos-containers/pelagos/releases/download/v$pkgver/pelagos-aarch64-linux"
                "pelagos-aarch64.sha256::https://github.com/pelagos-containers/pelagos/releases/download/v$pkgver/pelagos-aarch64-linux.sha256"
                "pelagos-$pkgver-src.tar.gz::https://github.com/pelagos-containers/pelagos/archive/refs/tags/v$pkgver.tar.gz")
sha256sums_x86_64=('b45569323b2304e495fda0da3d4ceb5d8bbe6b816c403df28c548706d91765e2' 'SKIP' 'dc77c3049e1d016910f7198df2298dcbb3c9bda28fc2ad96aeb16a3c7c5d6a59')
sha256sums_aarch64=('8ac2f7de3f1c8407fcb4260d9bbd7015bc4f1e70771136942f7c4e9dc6a42759' 'SKIP' 'dc77c3049e1d016910f7198df2298dcbb3c9bda28fc2ad96aeb16a3c7c5d6a59')

package() {
    # Install the pre-built binary.
    install -Dm755 "pelagos-${CARCH}" "$pkgdir/usr/bin/pelagos"

    # The release currently ships a single combined binary; pelagos-dns and the
    # wasm shim are built separately in the source package.  Extract them from
    # the source tarball so the -bin package is complete.
    # (Once the release workflow uploads them as separate artifacts this can be
    # simplified to direct binary installs.)
    local _srcdir="pelagos-$pkgver"

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
