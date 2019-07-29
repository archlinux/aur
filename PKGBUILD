major=19.30
minor=838629

pkgname='amdgpu-dkms'
pkgver=${major}_${minor}
pkgdesc="DKMS AMDGPU driver from AMD"
pkgrel=3
arch=('x86_64')
url=https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-navi-linux
license=('custom')
depends=('dkms')

DLAGENTS='https::/usr/bin/curl -O -e https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-navi-linux %u'

source=(https://drivers.amd.com/drivers/linux/amdgpu-pro-${major}-${minor}-ubuntu-18.04.tar.xz
        patch_amd_amdgpu_amdgpu_acpi_c.patch
        patch_amd_amdgpu_amdgpu_connectors_c.patch
        patch_amd_amdgpu_amdgpu_device_c.patch
        patch_amd_amdgpu_amdgpu_drv_c.patch
        patch_amd_amdgpu_amdgpu_fb_c.patch
        patch_amd_amdgpu_amdgpu_irq_c.patch
        patch_amd_amdgpu_amdgpu_mn_c.patch
        patch_amd_amdgpu_dce_v10_0_c.patch
        patch_amd_amdgpu_dce_v11_0_c.patch
        patch_amd_amdgpu_dce_v6_0_c.patch
        patch_amd_amdgpu_dce_v8_0_c.patch
        patch_amd_amdgpu_dce_virtual_c.patch
        patch_amd_amdgpu_gmc_v6_0_c.patch
        patch_amd_amdgpu_gmc_v7_0_c.patch
        patch_amd_amdgpu_gmc_v8_0_c.patch
        patch_amd_amdgpu_gmc_v9_0_c.patch
        patch_amd_amdkfd_kfd_doorbell_c.patch
        patch_amd_display_amdgpu_dm_amdgpu_dm_c.patch
        patch_amd_display_amdgpu_dm_amdgpu_dm_mst_types_c.patch
        patch_Makefile.patch)

sha256sums=('e2eb0a34745ecb9e244f81e0f3af8e4ab063d699dbc3e1a1e0867e8ce773d473'
            'd575728fbe9e53586a30c24865a4741b19ffb29e9845a2dd935cac3faea4bec9'
            'be0940ccf42c941a5537acfeff299b2b0588e7e5e8f01a53e76a01b30efca2fd'
            'aa09dc25dfdfbbcb1ccd16f5420f9f8291c5db97e7d366828244460015262f4a'
            'f3501aaae0680aeb4fd43c3d731c53544d53aa28a1b8bc728a33591c96f5417b'
            '62a6958c51817f53aeaf6d839132ebf4c81964658f6930146ac802d002d0ff74'
            'ad824a6e0d30ed93fbe68b532029d70aca7bdacb3c227c35b835a4471c0d18f7'
            '7c8efd69177fc84cb340feb1940b224b684ba6459327e0f09ff720e1f16039e6'
            '9bb273f24c8c207b3fd138f5ec7b735641a8575e8943b1ee9d1916c571cb7e80'
            '115aca05e36bbb335e3c4b606ebe49b91344af4383f11bae2b2518c4f235eb6a'
            '7bb66f1f259ee99aaca3471c0942fbc3b40cbcd26fea804b77ebeab75a105e89'
            'a55a2284fc11e58a67d60a38bf6e7c0056e6cdf71fe92c45b11f40a03a48ccc7'
            '771df8eee0e090994d82d825b2a054ed41a798c8b7fcbef0de2399e0891580a6'
            '4b66f561925791c5d32caed023c0e43ffd9870abd1741390aa789143cb5283f0'
            '01fe9db1ef0ae7eb68b55e46cfa6d6fea89f6b4472c4d9b2a268a8b2c2365ab1'
            'b6fee4ea027005e7b3b99cf47b071a82ec74f4b275f26186ce7ae5981b01693c'
            '271d6d7b81794d02fbb027222d15d217abf3eb51ee0ad968e86dda87d5e43485'
            '04cd611a19cd0bc47c8d300f623e4b1b1999ad2a9d4fa1040ac87fcfde968552'
            '3f650c253593ea7969be36ce64f6a6f23e41fa2088738e03cc1d5a89c33d54e7'
            '3079a671f88e4710f9a1698a7c1854fe6b275b4dfe916308f172c3545c721870'
            '13aba0223748b6af424058c250cb8d957ce56230b3044f98b66117a14fc5cc04')

build() {
    cd "${srcdir}/amdgpu-pro-${major}-${minor}-ubuntu-18.04"

    for m in core dkms; do
        echo "Extracting ${m}..."
        ar x "amdgpu-${m}_${major}-${minor}_all.deb"
        tar -xJf data.tar.xz -C "${srcdir}"
    done

    for p in ${srcdir}/patch_*.patch; do
        test -f "${p}" || continue
        patch -p1 -d "${srcdir}/usr/src/amdgpu-${major}-${minor}" -i "${p}"
    done

    mkdir -p "${srcdir}/usr/share/licenses/${pkgname}"
    find "${srcdir}/usr/share/doc" -name 'changelog.Debian.gz' -delete
    find "${srcdir}/usr/share/doc" -name 'copyright' -exec mv {} ${srcdir}/usr/share/licenses/${pkgname} \;
    find "${srcdir}/usr/share/doc" -type d -empty -delete
}

package() {
    cd "${srcdir}/amdgpu-pro-${major}-${minor}-ubuntu-18.04"

    cp -rf "${srcdir}/usr" "${pkgdir}"
    cp -rf "${srcdir}/etc" "${pkgdir}"
}
