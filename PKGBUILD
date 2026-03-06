# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20260210
pkgrel=2
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "blake2s.patch")
sha512sums=('705fbbb13e5d2f456fb321942ecd404420c5e54c75fbd28b7fd34583c9d6b0ca3b63e3eb18ddbb49f34354ffa0c042745fe2a0c97946a4dab65b52ebc864d5b5'
            '9880a8643738d6aadd21672aa2aa1965028ec839d1edb30bcf417988776d5547789d0f7417e77732966c4f245b7803e7278fd6b8366e0c224dcb13741f63cd85')

prepare() {
cd "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src"
patch -Np1 -i ../../blake2s.patch
}

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
