# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20251104
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5a6962d6cf49b97facd0ffa724a7a15b8736f7774086e0cc260ceac86d728ad8d72b42f8e6df4912bdd64ec17bbc732ba0540592996bda10221dfa87b1414bc9')

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
