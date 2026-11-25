# Maintainer: Christopher Brown <cjbrown102@gmail.com>
pkgname=pelagos-bin
pkgver=0.65.115
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
sha256sums_x86_64=('023826caaa567dfaa4b12ed4ab21b58ee8e1ad73a33a822fcdff8cb334996943' 'SKIP' '8b82a40ab02278e832aa1ae5cf25f75abf4e61a4fd6800e2fb85de8821fc3f0b' 'c2800a3e82bda1f3004c2e9947c777595082ecc969e0c1ca0cc687c5529607b9')
sha256sums_aarch64=('dc6ff8093002af2f4bebcdb5d07fb282c8161f46547f217fe0b1296c414a310f' 'SKIP' '8b82a40ab02278e832aa1ae5cf25f75abf4e61a4fd6800e2fb85de8821fc3f0b' 'bb6c9ad93cb337df3920c179aab6219ee142a68d2f4bc5c6f3ad3ba47c791c14')

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
