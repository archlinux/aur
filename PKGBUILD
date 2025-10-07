# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20251004
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c8f294b9e22dc815a63676e93c9efea09088a2550a3cd8b32687ef1494f5339b445d73789fbd027eba259c2b1e2668d9fca549658693ee949db1c974f151eaad')

package() {
depends=("dkms" "wget")
cat > "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/kernel-tree-scripts/prepare-sources.sh" <<'EOF'
#!/bin/bash -eux
kernel="${1%%[^0-9.]*}"
if [[ "$kernel" =~ .0$ ]]; then kernel="${kernel%.0}"; fi
kernel_major="${1%%[^0-9]*}"
wget "https://cdn.kernel.org/pub/linux/kernel/v${kernel_major}.x/linux-${kernel}.tar.xz" -O- | tar -xvJf - --wildcards linux-${kernel}/drivers/net/wireguard "linux-${kernel}/K*" linux-${kernel}/include/uapi/linux/
ln -sf linux-${kernel} kernel;
EOF
cat > "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/kernel-tree-scripts/cleanup-sources.sh" <<'EOF'
#!/bin/bash
AWG_TEMP_DIR="$(cat /var/lib/amnezia/amneziawg/.tempdir 2>/dev/null)"
PREFIX=${AWG_TEMP_DIR:-/tmp}
WORKDIR="${PREFIX}/amneziawg"
[ -e kernel ] && rm -rf kernel
if [[ -d "${WORKDIR}" ]]; then
rm -rf "${WORKDIR}";
fi
EOF
cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
sed -i 's/MODERN_KERNEL_SOURCES_NOT_FOUND_ERROR/KERNEL_SRC_ABSENT_ERR/g' Makefile
make DESTDIR=${pkgdir} dkms-install
}
