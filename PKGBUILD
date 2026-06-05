# Maintainer: Christopher Brown <cjbrown102@gmail.com>
pkgname=pelagos-bin
pkgver=0.65.26
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
sha256sums_x86_64=('76b8c1c8a249a19e27f71d1f6a44a87f7ed70e0a9f21f13a78e5e42faedaca10' 'SKIP' '93659671b5a77526c12ff671519f63998360d91cafcf8dd88beafe732dadeae3')
sha256sums_aarch64=('6123f2cb1088b07a1c1fbaee86510db286d94f710870c73d392078ced0ea73eb' 'SKIP' '93659671b5a77526c12ff671519f63998360d91cafcf8dd88beafe732dadeae3')

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
