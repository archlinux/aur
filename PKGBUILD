# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=xilinx-qdma-git
pkgver=20260226
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Xilinx QDMA'
url='https://xilinx.github.io/dma_ip_drivers/master/QDMA/linux-kernel/html/index.html'
license=('BSD')

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
	"patch_driver_xdev_h"
	"patch_makefile"
)
sha256sums=(
	'SKIP'
	'35d2c2b2dae14426e40fcd7b8f8f06513283356b40a8cfbd2b76c0a718250ca9'
	'130b0a798d950bba2234774e5a76db5114cc968e3a742edd39e42b0b69ce4f28'
	'892b02660a049562697f71f443767a12c25da5303969af059d865b099b174dee'
	'6ab905e563132ab3937379a7c1457b141b0eeddf037b2b85b8534a1c122a42f5'
	'b19c92ec8c1bb33186823f4c4a60d1408f1f7be77990642678f4f53f1097e382'
	'4e2123697e3327dc9ddbd99c0589abb02eddcc1d9e5fad7813ccbe628e1b566b'
)

prepare() {
	cd "${srcdir}/dma_ip_drivers"

	# Files that need a patch:
	# QDMA/linux-kernel/Makefile
	# QDMA/linux-kernel/apps/dma-xfer/dmaxfer.c
	# QDMA/linux-kernel/driver/Makefile
	# QDMA/linux-kernel/driver/libqdma/qdma_access/qdma_access_common.h
	# QDMA/linux-kernel/driver/libqdma/xdev.h
	# QDMA/linux-kernel/driver/src/Makefile

	# Note : command to create/update a patch file
	# git -C src/dma_ip_drivers/ diff <source_file> > <patch_file>

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

	CFLAGS="${CFLAGS//-flto=auto}"
	CXXFLAGS="${CXXFLAGS//-flto=auto}"
	LDFLAGS="${LDFLAGS//-flto=auto}"

	CFLAGS="${CFLAGS} -fno-lto"
	CXXFLAGS="${CXXFLAGS} -fno-lto"
	LDFLAGS="${LDFLAGS} -fno-lto"

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

}

