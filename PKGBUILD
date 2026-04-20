# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=xilinx-qdma-git
pkgver=20260226
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Xilinx PCI Express Multi Queue DMA (QDMA) driver for high-performance direct memory access (DMA) via PCI Express with UltraScale+ devices and beyond'
url='https://xilinx.github.io/dma_ip_drivers/master/QDMA/linux-kernel/html/index.html'
license=('BSD-3-Clause AND GPL-2.0-only')

# Note : Dependency is on currently running kernel, which the compilation based on, NOT on the kernel package installed
_local_linux_version=$(uname -r | sed -r 's/(-arch)/.arch/')

depends=(
	"linux=$_local_linux_version"
	"libaio"
)
makedepends=(
	"linux-headers=$_local_linux_version"
	"git"
)

source=(
	"git+https://github.com/Xilinx/dma_ip_drivers.git"
	"patch_access_common_h"
	"patch_app_dmaxfer"
	"patch_driver_makefile"
	"patch_driver_src_makefile"
	"patch_driver_thread_c"
	"patch_driver_xdev_h"
	"patch_makefile"
)
sha256sums=(
	'SKIP'
	'35d2c2b2dae14426e40fcd7b8f8f06513283356b40a8cfbd2b76c0a718250ca9'
	'130b0a798d950bba2234774e5a76db5114cc968e3a742edd39e42b0b69ce4f28'
	'892b02660a049562697f71f443767a12c25da5303969af059d865b099b174dee'
	'5751c45e82f9c20b1f5f407f4f74a2214ba9fabde209176960ae8dce62fd1867'
	'5be29e1916e604dac0f808b728bd2fbfec6102a6e2b8cf0cc8a47de7c4525ccc'
	'b19c92ec8c1bb33186823f4c4a60d1408f1f7be77990642678f4f53f1097e382'
	'395d581f1bd23ae35aab0a627292703f489aa094eddbab89a80b0bfd20dd4e7e'
)

# LTO triggers errors, disable it
options=('!lto')

prepare() {
	cd "${srcdir}/dma_ip_drivers"

	# Note : command to create/update a patch file
	# git -C src/dma_ip_drivers/ diff <source_file> > <patch_file>

	# Apply patches
	for f in ../patch_* ; do
		patch -p1 < $f
	done

}

pkgver() {
	cd "${srcdir}/dma_ip_drivers"
	# Date of the last git commit
	echo $(git log -n 1 --date=short | sed -n -e 's/^Date:\s*\([0-9-]*\)\s*$/\1/p' | tr -d -)
}

build() {
	cd "${srcdir}/dma_ip_drivers/QDMA/linux-kernel"

	# FIXME Remove some default makepkg CFLAGS that make compilation fail
	# Observed with : gcc 15.2.1, linux 6.19.11

	CFLAGS=${CFLAGS/-fno-plt/}
	CFLAGS=${CFLAGS/-fexceptions/}

	msg "Using CFLAGS ... $CFLAGS"
	msg "Using LDFLAGS .. $LDFLAGS"

	# Important : the Makefiles do not support parallel jobs
	# Note : Not sure at this stage if specifying future install paths are necessary
	make -j 1 \
		PREFIX=/usr \
		kernel_install_path="/usr/lib/modules/$(uname -r)/kernel/drivers/qdma" \
		dev_install_path="/usr/include/qdma" \
		apps_install_path="/usr/bin"

}

package() {
	cd "${srcdir}/dma_ip_drivers/QDMA/linux-kernel"

	# Important : the Makefiles do not support parallel jobs
	make -j 1 \
		PREFIX=/usr \
		kernel_install_path="${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/qdma" \
		dev_install_path="${pkgdir}/usr/include/qdma" \
		apps_install_path="${pkgdir}/usr/bin" \
		docs_install_path="${pkgdir}/usr/share/man/man8" \
		install

	# Install licenses
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" bsd_license.txt license.txt COPYING LICENSE

}

