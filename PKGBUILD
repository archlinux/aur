# Maintainer: Erin Allison <erin@eallison.us>

# BUILD INSTRUCTIONS:
# -------------------
#
# Please note that distribution of the driver files used in this
# package may be prohibited by NVIDIA's EULA.
# Please consult any applicable license agreements prior to
# usage of this script.
#
# You will need to acquire both NVIDIA-Linux-...-grid.run
# and ...-vgpu-kvm.run, place them in the same directory
# as this PKGBUILD file, and then run makepkg.

pkgbase='nvidia-vgpu'
pkgname=('nvidia-vgpu-dkms' 'nvidia-vgpu-utils')
pkgver=510.47.03
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
    'nvidia-vgpu-vfio.patch'
    'vgpu_unlock.patch'
    "file://${_vgpupkg}.run"
    'git+https://github.com/mbilker/vgpu_unlock-rs.git#commit=3858f2c')
sha256sums=('20676096714ac00d9fc993901ab275e4b0fa3f2eddc937dae395c8f4e8cb543e'
            '9c23ae9e0ef3b9b927608079ccc5f787e7e351a780f2369479c2e75dfd0470fe'
            'c85ae100a6c87c12906fd0057b77c0c4190f68434de4bc3bc89348ffc19aed61'
            '7f6c7ab8bdcff47589306c465906bf950c93a721cb1c01792ca8150530566316'
            '35bb29a3ea181ceadc6e27e88af863f10a6ba94ea16d9394cea4b50d384d3c47'
            'f77f26f609bb6f1eb69d3dc7e84ba704e5c065e424a619ab1460accb8247143f'
            '8656a261902e6569a71fbb55229dde8f03383772b6be50044102f250520d846f'
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
    patch -p1 < "${srcdir}/nvidia-vgpu-vfio.patch"
    popd

    pushd "${_vgpupkg}"
    patch -p1 < "${srcdir}/nv-kernel.patch"
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
