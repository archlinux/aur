pkgbase=xrt
pkgname=(xrt xrt-docs)
_pkgver_major=2023
_pkgver_minor=1
pkgver=${_pkgver_major}.${_pkgver_minor}
_pkgrelasever=2.15
_pkgpatchver=225
_upstream_tag=${_pkgver_major}${_pkgver_minor}0.${_pkgrelasever}.${_pkgpatchver}
pkgrel=1
arch=('x86_64')
url="https://github.com/Xilinx/XRT"
license=('Apache-2.0 AND GPL-2.0-only')
# TODO: check how 'libxcrypt'(libcrypt.so) is used.
# TODO: check how 'find_package(Curses)' is used.
# TODO: check for a complete list of dependencies
_xrt_depends=('dkms' 'ocl-icd' 'boost-libs' 'libdrm' 'protobuf') # 'libxcrypt')
# xrt does not specify opencl-clhpp in its cmake file, but cl2.hpp is indeed
# needed in its source file.
makedepends=(
    "${_xrt_depends[@]}"
    'cmake' 'boost' 'git' 'opencl-headers' 'opencl-clhpp' 'rapidjson' 'pybind11'
    'doxygen' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-breathe'
)
# No idea why this link is put in such a seemingly unrevalant page.
# (https://support.xilinx.com/s/question/0D52E00006hpPUGSA2/xrt-for-ubuntu-2004-lts?language=en_US)
#source=('https://www.xilinx.com/bin/public/openDownload?filename=xrt_202120.2.12.427_20.04-amd64-xrt.deb')
#sha256sums=('10a410392d6ddf20dc58297b078c3e0054efeecef856935fabcb7fd6fe686302')
# We have to use git repo rather than github release since the source need this
# to calculate its version related info.
_dma_ip_drivers_tag=51b4b383a6be6311cac7747a5de889a2b72a6d57
source=(
    "git+https://github.com/Xilinx/XRT.git#tag=${_upstream_tag}"
    "dma_ip_drivers-${_dma_ip_drivers_tag}.tar.gz::https://github.com/Xilinx/dma_ip_drivers/archive/${_dma_ip_drivers_tag}.tar.gz"
    # See src/runtime_src/doc/CMakeLists.txt
    "kernel-doc::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/plain/scripts/kernel-doc?h=v4.14.52"
)
sha256sums=('SKIP'
            '957ef7db9f4a604e340f89d748cf5fb8289f51194f4a15e09650270ab23e696d'
            '6956bf3fb7ba425d9d136dad908a0aa331c6faeda522d2bce0c3756c0619985b')

prepare() {
    cd "${srcdir}/XRT/src/runtime_src/core/pcie/driver/linux/xocl/lib/"
    rm -d libqdma
    cp -r "${srcdir}/dma_ip_drivers-${_dma_ip_drivers_tag}" "${srcdir}/XRT/src/runtime_src/core/pcie/driver/linux/xocl/lib/libqdma"
}

build() {
	export XRT_VERSION_PATCH=${_pkgpatchver}

	mkdir -p "${srcdir}/XRT/release_build"
	cd "${srcdir}/XRT/release_build"
    cp "${srcdir}/kernel-doc" .
    chmod +x ./kernel-doc

    export CXXFLAGS="${CXXFLAGS} -include cstdint"
    # TODO: set `$ENV{XILINX_VITIS}/gnu/microblaze` to allow
    # `src/runtime_src/ert` to be built.
	cmake ../src \
		-DCMAKE_BUILD_TYPE=Release
	make all xrt_docs
}

# xrt-aws dkms module is installed.
# TODO: check other differences and find what those differences will mean.
package_xrt() {
    _pkgname=${pkgbase}
    pkgdesc="Xilinx Run Time for FPGA, with its dkms modules"
    conflicts=('xrt-bin')
    depends=("${_xrt_depends[@]}")
    optdepends=(vivado)

    # Libalpm DKMS hook will detect `dkms.conf` and include headers in `/usr/src` and then trigger a dkms build.
	
	export XRT_VERSION_PATCH=${_pkgpatchver}

	cd "${srcdir}/XRT/release_build"
	DESTDIR="${pkgdir}" make install

	install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

package_xrt-docs() {
    _pkgname=${pkgbase}-docs
    pkgdesc="Documentation for the Xilinx Run Time"

    mkdir -p "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/XRT/release_build/runtime_src/doc/html" "${pkgdir}/usr/share/doc/${_pkgname}"
    
    install -Dm644 "${srcdir}/XRT/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# ==> dkms remove --no-depmod xrt/2.14.354 -k 5.10.184-1-lts510
# ==> dkms remove --no-depmod xrt/2.14.354 -k 5.15.107.62.realtime1-2-rt-lts
# ==> dkms remove --no-depmod xrt/2.14.354 -k 5.4.247-1-lts54
# ==> dkms remove --no-depmod xrt-aws/2.14.354 -k 5.10.184-1-lts510
# ==> dkms remove --no-depmod xrt-aws/2.14.354 -k 5.15.107.62.realtime1-2-rt-lts
# ==> dkms remove --no-depmod xrt-aws/2.14.354 -k 5.4.247-1-lts54
# ==> dkms remove --no-depmod xrt-aws/2.14.354 -k 6.1.33-hardened1-1-hardened
# ==> dkms remove --no-depmod xrt-aws/2.14.354 -k 6.1.35-1-lts
