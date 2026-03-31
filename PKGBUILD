# Maintainer: Ricky Perrone <rickyperrone@gmail.com>
# Basado en el trabajo de: Giancarlo Razzolini <grazzolini@archlinux.org>

pkgbase=nvidia-340xx-utils-macbook
pkgname=('nvidia-340xx-utils-macbook' 'opencl-nvidia-340xx-macbook')
pkgver=340.108
pkgrel=40
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom')
options=('!strip')
install=nvidia-340xx-utils.install
source=(nvidia-drm-outputclass.conf
        "https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
        nvidia-340xx-utils.sysusers)
# 3 fuentes = 3 sumas de control
sha512sums=('SKIP'
            '9f636aab5ffee36c951bd450bd56db397e6eb127ac6ef2b93eade3850892966195602c2d894548c7b19da38f40a144f4d98f835d8c695038ff6c65249129e739'
            'SKIP')

[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

create_links() {
    find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib; do
        _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
        _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
        [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
        [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
    done
}

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    bsdtar -xf nvidia-persistenced-init.tar.bz2
}

package_opencl-nvidia-340xx-macbook() {
    pkgdesc="OpenCL implementation for NVIDIA - MacBook 6,1"
    depends=('zlib')
    conflicts=('opencl-nvidia' 'opencl-nvidia-340xx')
    provides=('opencl-nvidia' 'opencl-driver' 'opencl-nvidia-340xx')
    cd "${_pkg}"

    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

    create_links
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia "${pkgdir}/usr/share/licenses/opencl-nvidia-macbook"
}

package_nvidia-340xx-utils-macbook() {
    pkgdesc="NVIDIA drivers utilities for MacBook 6,1 (Matches rel-40 driver)"
    depends=('xorg-server' 'libglvnd')
    conflicts=('nvidia-340xx-libgl' 'nvidia-libgl' 'nvidia-utils' 'nvidia-340xx-utils')
    provides=('libgl' 'libgles' 'libegl' 'nvidia-340xx-libgl' 'nvidia-libgl' 'nvidia-utils' 'nvidia-340xx-utils')
    
    cd "${_pkg}"

    install -D -m755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"
    install -D -m755 "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so.1"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so"

    for lib in libGL libEGL libGLESv1_CM libGLESv2 libnvidia-glcore libnvidia-eglcore libnvidia-glsi libnvidia-ifr libnvidia-fbc libnvidia-encode libnvidia-cfg libnvidia-ml libcuda libnvcuvid; do
        install -D -m755 "${lib}.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/${lib}.so.${pkgver}"
    done
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"
    install -D -m755 "tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-tls.so.${pkgver}"

    for bin in nvidia-debugdump nvidia-xconfig nvidia-bug-report.sh nvidia-smi nvidia-cuda-mps-server nvidia-cuda-mps-control nvidia-persistenced; do
        install -D -m755 "${bin}" "${pkgdir}/usr/bin/${bin}"
    done
    install -D -m4755 nvidia-modprobe "${pkgdir}/usr/bin/nvidia-modprobe"

    install -D -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/nvidia/LICENSE"
    install -dm 755 "${pkgdir}"/etc/ld.so.conf.d
    echo -e '/usr/lib/nvidia/' > "${pkgdir}"/etc/ld.so.conf.d/00-nvidia-macbook.conf
    
    install -Dm644 "${srcdir}/nvidia-340xx-utils.sysusers" "${pkgdir}/usr/lib/sysusers.d/nvidia-340xx-utils-macbook.conf"

    create_links
}
