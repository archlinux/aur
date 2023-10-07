# Maintainer: nuvole <mitltlatltl@gmail.com>
pkgname=intel-i915-backport-dkms
pkgver=$(curl -s "https://raw.githubusercontent.com/intel-gpu/intel-gpu-i915-backports/backport/main/versions" | grep -i "BACKPORTS_RELEASE_TAG" | grep -Eo '[0-9.]+' | tail -n 2 | tr "\n" "_" | sed "s/_//2")
pkgrel=1
pkgdesc="Out of tree dkms driver for i915, with GPU debugging (on Max, Flex and Arc GPUs), SR-IOV, VM_BIND and ULLS (Ultra Low Latency Submission) supported"
arch=('x86_64')
url="https://dgpu-docs.intel.com/releases/index.html"
license=('GPL2')
depends=('dkms' 'linux-headers' 'linux<6')
makedepends=('make' 'flex' 'bison' 'git')
source=("git+https://github.com/intel-gpu/intel-gpu-i915-backports.git"
'dkms.conf')
sha512sums=('SKIP'
'3e5a334bfdc84e3032ee6d18a5a042ec32cc997c537f98a91ea2e29aa23c0a693089f6e63127ac4efc81c09cb2de3057cf97762ab9e069a466fe9b8f68428461')

package() {

    # copy dkms configuration file and keep a clean copy
    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
    sed -i "s/__VERSION_STRING/${pkgver}/" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"

    cd "${srcdir}/intel-gpu-i915-backports"
    git checkout backport/main
    install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
    cp -r "./" "${pkgdir}/usr/src/${pkgname}-${pkgver}"

    echo -e "\033[0;31mplease enable the following kernel options"
    echo -e "\033[0;31m intel_iommu=on \n iommu=pt \n i915.modeset=1 \n i915.enable_guc=3 \n i915.max_vfs=7 \n vfio-pci.enable_sriov=1"
    echo -e "\033[0;31m you should also download the latest firmware from https://github.com/intel-gpu/intel-gpu-firmware for your platform"
    echo -e '\033[0;31m after reboot, use sudo sh -c "echo 7 > /sys/devices/pci0000:00/0000:00:02.0/sriov_numvfs" to enable up to 7 VFS'
}
