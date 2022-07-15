# Maintainer: Erin Allison <erin@eallison.us>

# BUILD INSTRUCTIONS:
# -------------------
#
# Please note that distribution of the driver files used in this
# package may be prohibited by NVIDIA's EULA.
# Please consult any applicable license agreements prior to
# usage of this script.
#
# You will need to acquire both NVIDIA-Linux-...-vgpu-kvm.run
# place it in the same directory as this PKGBUILD file, and then run makepkg.

pkgbase='nvidia-vgpu'
pkgname=('nvidia-vgpu-dkms' 'nvidia-vgpu-utils')
pkgver=510.73.06
pkgrel=1
arch=('x86_64')
makedepends=('git' 'rust')
url='https://krutavshah.github.io/GPU_Virtualization-Wiki/'
license=('custom')
options=('!strip')
groups=('nvidia-vgpu')
_vgpupkg="NVIDIA-Linux-${CARCH}-${pkgver}-vgpu-kvm"

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=(
    'nvidia-smi'
    'nvidia-vgpu.conf'
    'vgpu_unlock-rs.conf'
    'nv-kernel.patch'
    'nvidia-510.73.05-vgpu-5.18.patch'
    'vgpu_unlock.patch'
    "file://${_vgpupkg}.run"
    'git+https://github.com/mbilker/vgpu_unlock-rs.git#commit=3858f2c')
sha256sums=('20676096714ac00d9fc993901ab275e4b0fa3f2eddc937dae395c8f4e8cb543e'
            '9c23ae9e0ef3b9b927608079ccc5f787e7e351a780f2369479c2e75dfd0470fe'
            'c85ae100a6c87c12906fd0057b77c0c4190f68434de4bc3bc89348ffc19aed61'
            '36325e26243429e1e55c8500bcac850fea6e6a8975a657984c0979042a001c7b'
            '79b09682f9c3cfa32d219a14b3c956d8f05340addd5a43e7063c3d96175a56f4'
            'f77f26f609bb6f1eb69d3dc7e84ba704e5c065e424a619ab1460accb8247143f'
            'b7d076bee270e779b7c1eb512c9325794be2e8cbd7cd37c0f62fc72d87654a82'
            'SKIP')

create_links() {
    # create soname links
    find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib; do
        _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
        _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
        [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
        [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
    done
}

prepare() {
    rm -rf "${_vgpupkg}"
    sh "${_vgpupkg}.run" -x

    gunzip "${_vgpupkg}"/nvidia-smi.1.gz

    sed \
      -e "s/__VERSION_STRING/${pkgver}/" \
      -e 's/__JOBS/`nproc`/' \
      -e 's/__DKMS_MODULES//' \
      -e '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-vgpu-vfio"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"' \
      -e 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' \
      -i "${_vgpupkg}/kernel/dkms.conf"

    pushd "${_vgpupkg}"
    patch -p1 < "${srcdir}/nvidia-510.73.05-vgpu-5.18.patch"
    popd

    pushd "${_vgpupkg}"
    patch -u kernel/nvidia/nv-kernel.o_binary < "${srcdir}/nv-kernel.patch"
    patch -p1 < "${srcdir}/vgpu_unlock.patch"
    popd
}

build() {
    cd "${srcdir}/vgpu_unlock-rs"

    cargo build -j `nproc` --release
}

package_nvidia-vgpu-dkms() {
    pkgdesc="NVIDIA drivers - module sources; patched for consumer vGPU support w/ Rust unlock"
    depends=('dkms' "nvidia-vgpu-utils=${pkgver}")
    conflicts=('nvidia-dkms')

    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_vgpupkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"

    echo "blacklist nouveau" | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
    echo "nvidia-uvm"        | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

    install -D -m644 "${_vgpupkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_nvidia-vgpu-utils() {
    pkgdesc="NVIDIA drivers utilities; patched for consumer vGPU support w/ Rust unlock"
    optdepends=('mdevctl: mediated device contfiguration tool'
                'libvirt: virtualization engine control interface')
    conflicts=('nvidia-utils')
    provides=('vgpu_unlock')
    replaces=('vgpu_unlock')

    # misc
    install -D -m755 "${_vgpupkg}/libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ml.so.${pkgver}"

    # vGPU
    install -D -m755 "${_vgpupkg}/libnvidia-vgpu.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-vgpu.so.${pkgver}"
    install -D -m755 "${_vgpupkg}/libnvidia-vgxcfg.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-vgxcfg.so.${pkgver}"

    # DEBUG
    install -D -m755 "${_vgpupkg}/nvidia-debugdump" "${pkgdir}/usr/bin/nvidia-debugdump"

    # nvidia-bug-report
    install -D -m755 "${_vgpupkg}/nvidia-bug-report.sh" "${pkgdir}/usr/bin/nvidia-bug-report.sh"

    # nvidia-smi
    install -D -m755 "${_vgpupkg}/nvidia-smi" "${pkgdir}/usr/lib/nvidia/nvidia-smi.orig"
    install -D -m644 "${_vgpupkg}/nvidia-smi.1" "${pkgdir}/usr/share/man/man1/nvidia-smi.1"
    install -D -m755 "${srcdir}/nvidia-smi" "${pkgdir}/usr/bin/nvidia-smi"

    # nvidia-vgpu
    install -D -m755 "${_vgpupkg}/nvidia-vgpud" "${pkgdir}/usr/bin/nvidia-vgpud"
    install -D -m755 "${_vgpupkg}/nvidia-vgpu-mgr" "${pkgdir}/usr/bin/nvidia-vgpu-mgr"
    install -D -m644 "${_vgpupkg}/vgpuConfig.xml" "${pkgdir}/usr/share/nvidia/vgpu/vgpuConfig.xml"
    install -D -m644 "${_vgpupkg}/init-scripts/systemd/nvidia-vgpud.service" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpud.service"
    install -D -m644 "${_vgpupkg}/init-scripts/systemd/nvidia-vgpu-mgr.service" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpu-mgr.service"
    install -D -m644 "${srcdir}/vgpu_unlock-rs.conf" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpud.service.d/30-vgpu_unlock-rs.conf"
    install -D -m644 "${srcdir}/vgpu_unlock-rs.conf" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpu-mgr.service.d/30-vgpu_unlock-rs.conf"
    install -D -m644 "${srcdir}/nvidia-vgpu.conf" "${pkgdir}/usr/lib/systemd/system/libvirtd.service.d/20-nvidia-vgpu.conf"

    install -D -m644 "${_vgpupkg}/README.txt" "${pkgdir}/usr/share/doc/nvidia/README"
    install -D -m644 "${_vgpupkg}/NVIDIA_Changelog" "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
    cp -r "${_vgpupkg}/html" "${pkgdir}/usr/share/doc/nvidia/"
    ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

    create_links

    # vgpu_unlock-rs
    install -D -m755 "vgpu_unlock-rs/target/release/libvgpu_unlock_rs.so" "${pkgdir}/usr/lib/nvidia/libvgpu_unlock_rs.so"

    install -D -m644 "${_vgpupkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/VGPU_LICENSE"
    install -D -m644 "vgpu_unlock-rs/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/VGPU_UNLOCK-RS_LICENSE"
}
