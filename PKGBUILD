# Maintainer: failsafe65
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>
# Contributor: Vasiliy Stelmachenok <ventureo@yandex.ru>

pkgbase=nvidia-550xx-dkms
pkgname=('nvidia-550xx-utils' 'opencl-nvidia-550xx' 'nvidia-550xx-dkms')
pkgver=550.163.01
pkgrel=5
pkgdesc="NVIDIA drivers for Linux, 550 branch"
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom')
options=('!strip')
makedepends=('patchelf')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=('nvidia-drm-outputclass.conf'
		'nvidia-utils.sysusers'
		'nvidia.rules'
		'systemd-homed-override.conf'
		'systemd-suspend-override.conf'
		'0002-CFLAGS-Set-std-gnu17-for-all-compilation-flags.patch'
		'0003-Workaround-nv_vm_flags_-calling-GPL-only-code.patch'
		'0004-kernel-open-nvidia-Use-new-timer-functions-for-6.15.patch'
		'0005-kernel-nvidia-Fulfill-6.17-fb_create-contract.patch'
		'0006-kernel-nvidia-use-new-helper-macros-and-post-removal-in_irq-for-6.19.patch'
		"https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run")
sha512sums=('de7116c09f282a27920a1382df84aa86f559e537664bb30689605177ce37dc5067748acf9afd66a3269a6e323461356592fdfc624c86523bf105ff8fe47d3770'
			'4b3ad73f5076ba90fe0b3a2e712ac9cde76f469cd8070280f960c3ce7dc502d1927f525ae18d008075c8f08ea432f7be0a6c3a7a6b49c361126dcf42f97ec499'
			'f8f071f5a46c1a5ce5188e104b017808d752e61c0c20de1466feb5d693c0b55a5586314411e78cc2ab9c0e16e2c67afdd358da94c0c75df1f8233f54c280762c'
			'a0183adce78e40853edf7e6b73867e7a8ea5dabac8e8164e42781f64d5232fbe869f850ab0697c3718ebced5cde760d0e807c05da50a982071dfe1157c31d6b8'
			'55def6319f6abb1a4ccd28a89cd60f1933d155c10ba775b8dfa60a2dc5696b4b472c14b252dc0891f956e70264be87c3d5d4271e929a4fc4b1a68a6902814cee'
			'6814990f8046759d35f724ac9114d7fa284710fd1ad8cca7e1a861ea54a72fe4f67b5614f157a911f5ecfa0c964fa989edc61c85b1cfef6428e0cd7cdeea856e'
			'21c964b4d0ceda23d543485cb285becf111849313da3ff9cc9c7bed241de83fd826d72f196d071e4f53790b8fd5d1e3dab9319c0ca08b37c9c841f45d3afd041'
			'eb5cfdb4ccaea5aee8626009b66c9024929fd921784080fb34b6db0f222c2908ea7c4932e492c24afb570de79c78489d67e4e07312dc67ce6415ad0b5f38e008'
			'0c724767bb4300d354dadca5f020f99958624c33dcaf54ec1ac7678832ae42608a0320d03d1c0efa3c0a386d79330f2b1902ca543e04e3a3efc7c6289edf9e47'
			'14538d5981d1055fd60f9071cdd38815f34f6975cea9700a8c928c3b3a4479b30ebeeb6b3b8ea0219ce22fcaac22a03404faf00e7d424e3fee188d9efee8028c'
			'676b1de35d21e80091528a49080c114e0870ea90b3f3721265ae8071abbc2183c851e6f11ba96a332c743fedfaf4ec9a014ad6ceed586fdbb03d94d33405e356')


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
	sh "${_pkg}.run" --extract-only
	cd "${_pkg}"
	bsdtar -xf nvidia-persistenced-init.tar.bz2
	
	# GCC 15
	patch -Np1 -i "${srcdir}/0002-CFLAGS-Set-std-gnu17-for-all-compilation-flags.patch" -d "${srcdir}/${_pkg}/kernel"

	# Linux 6.15
	sed -i 's/EXTRA_CFLAGS/ccflags-y/' ${srcdir}/${_pkg}/kernel{,-open}/Kbuild
	patch -Np1 -i "${srcdir}/0003-Workaround-nv_vm_flags_-calling-GPL-only-code.patch" -d "${srcdir}/${_pkg}/kernel"
	patch -Np2 -i "${srcdir}/0004-kernel-open-nvidia-Use-new-timer-functions-for-6.15.patch" -d "${srcdir}/${_pkg}/kernel"

	# Linux 6.17
	patch -Np1 -i "${srcdir}/0005-kernel-nvidia-Fulfill-6.17-fb_create-contract.patch" -d "${srcdir}/${_pkg}"

	# Linux 6.19
	patch -Np1 -i "${srcdir}/0006-kernel-nvidia-use-new-helper-macros-and-post-removal-in_irq-for-6.19.patch" -d "${srcdir}/${_pkg}"

	cd kernel

	sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
	sed -i 's/__JOBS/`nproc`/' dkms.conf
	sed -i 's/__DKMS_MODULES//' dkms.conf
	sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"\
BUILT_MODULE_NAME[4]="nvidia-peermem"\
DEST_MODULE_LOCATION[4]="/kernel/drivers/video"' dkms.conf

	# Gift for linux-rt guys
	sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' dkms.conf
}

package_opencl-nvidia-550xx() {
	pkgdesc="OpenCL implemention for NVIDIA, 550 branch"
	depends=('zlib')
	optdepends=('opencl-headers: headers necessary for OpenCL development')
	conflicts=('opencl-nvidia')
	provides=('opencl-nvidia' 'opencl-driver')
	cd "${_pkg}"

	# OpenCL
	install -Dm644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
	install -Dm755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

	create_links

	mkdir -p "${pkgdir}/usr/share/licenses"
	ln -s nvidia-utils "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_nvidia-550xx-dkms() {
	pkgdesc="NVIDIA drivers - module sources, 550 branch"
	depends=('dkms' "nvidia-utils=${pkgver}" 'libglvnd')
	provides=("nvidia-dkms=${pkgver}" 'NVIDIA-MODULE' 'nvidia')
	conflicts=('nvidia-dkms' 'NVIDIA-MODULE' 'nvidia')

	cd ${_pkg}

	install -dm 755 "${pkgdir}"/usr/src
	cp -dr --no-preserve='ownership' kernel "${pkgdir}/usr/src/nvidia-${pkgver}"

	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

package_nvidia-550xx-utils() {
	pkgdesc="NVIDIA drivers utilities, 550 branch"
	depends=('libglvnd' 'egl-wayland')
	optdepends=('nvidia-settings: configuration tool'
				'xorg-server: Xorg support'
				'xorg-server-devel: nvidia-xconfig'
				'opencl-nvidia: OpenCL support')
	conflicts=('nvidia-utils' 'nvidia-libgl' 'egl-gbm')
	provides=("nvidia-utils=${pkgver}" 'vulkan-driver' 'opengl-driver' 'nvidia-libgl' 'egl-gbm')
	install="${pkgname}.install"

	cd "${_pkg}"

	# Check http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/README/installedcomponents.html
	# for hints on what needs to be installed where.

	# X driver
	install -Dm755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

	# Wayland/GBM
	install -Dm755 libnvidia-egl-gbm.so.1* -t "${pkgdir}/usr/lib/"
	install -Dm644 15_nvidia_gbm.json "${pkgdir}/usr/share/egl/egl_external_platform.d/15_nvidia_gbm.json"
	mkdir -p "${pkgdir}/usr/lib/gbm"
	ln -sr "${pkgdir}/usr/lib/libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib/gbm/nvidia-drm_gbm.so"

	# firmware
	install -Dm644 -t "${pkgdir}/usr/lib/firmware/nvidia/${pkgver}/" firmware/*.bin

	# GLX extension module for X
	install -Dm755 "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.${pkgver}"
	# Ensure that X finds glx
	ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.1"
	ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so"

	install -Dm755 "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLX_nvidia.so.${pkgver}"

	# OpenGL libraries
	install -Dm755 "libEGL_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libEGL_nvidia.so.${pkgver}"
	install -Dm755 "libGLESv1_CM_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM_nvidia.so.${pkgver}"
	install -Dm755 "libGLESv2_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2_nvidia.so.${pkgver}"
	install -Dm644 "10_nvidia.json" "${pkgdir}/usr/share/glvnd/egl_vendor.d/10_nvidia.json"

	# OpenGL core library
	install -Dm755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glcore.so.${pkgver}"
	install -Dm755 "libnvidia-eglcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-eglcore.so.${pkgver}"
	install -Dm755 "libnvidia-glsi.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glsi.so.${pkgver}"

	# misc
	install -Dm755 "libnvidia-api.so.1" "${pkgdir}/usr/lib/libnvidia-api.so.1"
	install -Dm755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-fbc.so.${pkgver}"
	install -Dm755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-encode.so.${pkgver}"
	install -Dm755 "libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-cfg.so.${pkgver}"
	install -Dm755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ml.so.${pkgver}"
	install -Dm755 "libnvidia-glvkspirv.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glvkspirv.so.${pkgver}"
	install -Dm755 "libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-allocator.so.${pkgver}"
	install -Dm755 "libnvidia-gpucomp.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-gpucomp.so.${pkgver}"

	# Vulkan ICD
	install -Dm644 "nvidia_icd.json" "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"
	install -Dm644 "nvidia_layers.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/nvidia_layers.json"

	# VDPAU
	install -Dm755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"

	# nvidia-tls library
	install -Dm755 "libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}"

	# CUDA
	install -Dm755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
	install -Dm755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"
	install -Dm755 "libcudadebugger.so.${pkgver}" "${pkgdir}/usr/lib/libcudadebugger.so.${pkgver}"

	# NVVM Compiler library loaded by the CUDA driver to do JIT link-time-optimization
	install -Dm644 "libnvidia-nvvm.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-nvvm.so.${pkgver}"

	# PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
	install -Dm755 "libnvidia-ptxjitcompiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ptxjitcompiler.so.${pkgver}"

	# raytracing
	install -Dm755 "nvoptix.bin" "${pkgdir}/usr/share/nvidia/nvoptix.bin"
	install -Dm755 "libnvoptix.so.${pkgver}" "${pkgdir}/usr/lib/libnvoptix.so.${pkgver}"
	install -Dm755 "libnvidia-rtcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-rtcore.so.${pkgver}"

	# NGX
	install -Dm755 nvidia-ngx-updater "${pkgdir}/usr/bin/nvidia-ngx-updater"
	install -Dm755 "libnvidia-ngx.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ngx.so.${pkgver}"
	install -Dm755 _nvngx.dll "${pkgdir}/usr/lib/nvidia/wine/_nvngx.dll"
	install -Dm755 nvngx.dll "${pkgdir}/usr/lib/nvidia/wine/nvngx.dll"

	# Optical flow
	install -Dm755 "libnvidia-opticalflow.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opticalflow.so.${pkgver}"

	# Cryptography library wrapper
	install -Dm755 "libnvidia-pkcs11.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-pkcs11.so.${pkgver}"
	install -Dm755 "libnvidia-pkcs11-openssl3.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-pkcs11-openssl3.so.${pkgver}"

	# Debug
	install -Dm755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"

	# nvidia-xconfig
	install -Dm755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
	install -Dm644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"

	# nvidia-bug-report
	install -Dm755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"

	# nvidia-smi
	install -Dm755 nvidia-smi "${pkgdir}/usr/bin/nvidia-smi"
	install -Dm644 nvidia-smi.1.gz "${pkgdir}/usr/share/man/man1/nvidia-smi.1.gz"

	# nvidia-cuda-mps
	install -Dm755 nvidia-cuda-mps-server "${pkgdir}/usr/bin/nvidia-cuda-mps-server"
	install -Dm755 nvidia-cuda-mps-control "${pkgdir}/usr/bin/nvidia-cuda-mps-control"
	install -Dm644 nvidia-cuda-mps-control.1.gz "${pkgdir}/usr/share/man/man1/nvidia-cuda-mps-control.1.gz"

	# nvidia-modprobe
	# This should be removed if nvidia fixed their uvm module!
	install -Dm4755 nvidia-modprobe "${pkgdir}/usr/bin/nvidia-modprobe"
	install -Dm644 nvidia-modprobe.1.gz "${pkgdir}/usr/share/man/man1/nvidia-modprobe.1.gz"

	# nvidia-persistenced
	install -Dm755 nvidia-persistenced "${pkgdir}/usr/bin/nvidia-persistenced"
	install -Dm644 nvidia-persistenced.1.gz "${pkgdir}/usr/share/man/man1/nvidia-persistenced.1.gz"
	install -Dm644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
	sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"

	# application profiles
	install -Dm644 nvidia-application-profiles-${pkgver}-rc "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-rc"
	install -Dm644 nvidia-application-profiles-${pkgver}-key-documentation "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-key-documentation"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nvidia-utils/LICENSE"
	install -Dm644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
	install -Dm644 NVIDIA_Changelog "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
	cp -r html "${pkgdir}/usr/share/doc/nvidia/"
	ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

	# new power management support
	install -Dm644 systemd/system/*.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm755 systemd/system-sleep/nvidia "${pkgdir}/usr/lib/systemd/system-sleep/nvidia"
	install -Dm755 systemd/nvidia-sleep.sh "${pkgdir}/usr/bin/nvidia-sleep.sh"
	install -Dm755 nvidia-powerd "${pkgdir}/usr/bin/nvidia-powerd"
	install -Dm644 nvidia-dbus.conf "${pkgdir}"/usr/share/dbus-1/system.d/nvidia-dbus.conf
	install -Dm644 "${srcdir}"/systemd-homed-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-homed.service.d/10-nvidia-no-freeze-session.conf
	install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-suspend.service.d/10-nvidia-no-freeze-session.conf
	install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-suspend-then-hibernate.service.d/10-nvidia-no-freeze-session.conf
	install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-hibernate.service.d/10-nvidia-no-freeze-session.conf
	install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-hybrid-sleep.service.d/10-nvidia-no-freeze-session.conf

	# distro specific files must be installed in /usr/share/X11/xorg.conf.d
	install -Dm644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

	install -Dm644 "${srcdir}/nvidia-utils.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

	install -Dm644 "${srcdir}/nvidia.rules" "$pkgdir"/usr/lib/udev/rules.d/60-nvidia.rules

	echo "blacklist nouveau" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
	echo "nvidia-uvm" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

	create_links
}
