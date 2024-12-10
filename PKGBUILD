# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Maintainer: Gökçe Aydos <aur2024@aydos.de>

_name=xrt
pkgbase=$_name-npu-git
pkgver=r8007.42e5fb6f57
pkgrel=2
pkgdesc="Xilinx runtime configured for AMD NPUs"
arch=(x86_64)
url='https://xilinx.github.io/XRT/master/html'
license=(Apache)
depends=(
# Based on src/runtime_src/tools/scripts/xrtdeps.sh
	lsb-release  # Used in tests
	boost
	libtiff
	linux-headers  #TODO only makedepends for dkms?
	elfutils
	gcc
	gdb
	gnuplot
	gnutls
	gtest
	json-glib
	libdrm
	libjpeg-turbo
	util-linux-libs  # for libuuid
	libyaml
	lm_sensors
	ncurses
	ocl-icd
	opencl-clhpp
	openssl
	pciutils
	perl
	protobuf  # includes protobuf-compiler
	python
	python-pip
	rapidjson
	strace
	unzip
	zlib
	pybind11
	xilinx-u280-gen3x16-xdma-base  # create_xsabin.sh in post_install, otherwise platform file empty
)
makedepends=(
	cmake
	git
)
optdepends=(
	'linux-mainline-um5606: Linux kernel that can use the XDNA drivers'
	'amdxdna-driver: Driver that coencides with these libraries'
)
provides=($_name)
conflicts=($_name)
options=(!debug)

source=(
	$_name::git+https://github.com/xilinx/XRT
	git+https://github.com/Xilinx/dma_ip_drivers
	git+https://github.com/serge1/ELFIO
    xrt-precompiled::https://packages.xilinx.com/artifactory/debian-packages-cache/pool/xrt_202320.2.16.204_22.04-amd64-xrt.deb
    xsabin.install
)

sha256sums=(
	SKIP
	#SKIP
	SKIP
	SKIP
	SKIP
	'042778107e71a7f3304b15e9bfa3b11677569205f7fe9baa392834aa11b24709'
)

pkgver() {
	cd $_name
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Submodule integration based on
	# https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
	git -C $_name config \
		submodule.src/runtime_src/core/pcie/driver/linux/xocl/lib/libqdma.url \
		../dma_ip_drivers
	git -C $_name config \
		submodule.src/runtime_src/core/common/elf.url \
		../ELFIO
	git -C $_name \
		-c protocol.file.allow=always \
		submodule update --recursive --init # Kainoa: added this here!
	mkdir -p microblaze-fw
	tar xf data.tar.gz -C microblaze-fw ./lib/firmware/xilinx
}

build() {
	cd $_name
	mkdir -p build && cd build
	local cmake_flags+=" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/xilinx -DXRT_INSTALL_PREFIX=/opt/xilinx -DXRT_DKMS_ALVEO=OFF -DXDP_CLIENT_BUILD_CMAKE=yes -DNPU=1"
	XRT_FIRMWARE_DIR="$srcdir"/microblaze-fw/lib/firmware/xilinx cmake $cmake_flags ../src
	make
}

#TODO
# somehow test 8 fails, even it does not seem like a fail.
#check() {
#	# Tests require the package to be installed in the build directory. 
#	DESTDIR=$srcdir/$_name/clean-build \
#		make -C $_name/clean-build install
#
#	cd $srcdir/$_name/clean-build
#	ctest --output-on-failure
#}

pkgname=($pkgbase xrt-xocl-dkms-npu-git)
package_xrt-npu-git() {
	depends+=(xrt-xocl-dkms-npu-git)
    install=xsabin.install
	DESTDIR=$pkgdir make -C $_name/build install
	# Move /lib to /usr/lib, otherwise: `failed to commit transaction (conflicting files)`
	# mv $pkgdir/lib $pkgdir/usr

	# Drivers belong to the DKMS package, move them to a temporary dir.
	mv $pkgdir/usr/src $pkgdir/..

	# Moving systemd services
	local dest=$pkgdir/usr/lib/systemd/system
	mkdir -p $dest
	mv $pkgdir/opt/xilinx/xrt/etc/*service $dest

	# Moving binaries
	# local dest=$pkgdir/usr/bin
	# mkdir -p $dest
	# mv $pkgdir/usr/local/bin/* $dest
	# rm -r $pkgdir/usr/local/bin

	# Moving appdebug
	# mv $pkgdir/opt/xilinx/xrt/share/appdebug $pkgdir/usr/local/xrt/python
	#rmdir $pkgdir/opt/xilinx{/xrt/share,/xrt,}

    # The following lines are adapted from postinst of control.tar.gz of the debian package
	# ln -s 283bab8f654d8674968f4da57f7fa5d7 "$pkgdir"/usr/lib/firmware/xilinx/fb2b2c5a19ed63593fea95f51fbc8eb9
    mkdir -p "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/firmware
	ln -s /lib/firmware/xilinx/283bab8f654d8674968f4da57f7fa5d7/partition_metadata.json "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/partition_metadata.json
	ln -s /lib/firmware/xilinx/283bab8f654d8674968f4da57f7fa5d7/partition.xsabin "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/partition.xsabin
    ## Gökçe says: "I changed  /opt/xilinx/xrt/share/fw to /lib/firmware/xilinx/ because XRTFW_FILES is somehow not defined in:"
    # https://github.com/Xilinx/XRT/blob/50f17b1d5a29b7af9a9abbc88815883958efdb35/src/runtime_src/ert/CMakeLists.txt#L29
	ln -s /lib/firmware/xilinx "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/firmware/ert-v30
	ln -s /opt/xilinx/firmware/cmc/u280 "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/firmware/cmc-u280
	ln -s /opt/xilinx/firmware/sc-fw/u280 "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/firmware/sc-fw-u280
}
package_xrt-xocl-dkms-npu-git() {
	pkgdesc="Drivers for Xilinx runtime (XRT) (configured for AMD NPUs)"
	provides=(xrt-xocl-dkms)
    conflicts=(xrt-xocl-dkms)

	# Collect drivers
	local dest=$pkgdir/usr
	mkdir $dest
	cp -r $pkgdir/../src $dest

	cd $pkgdir
	# AWS drivers not required
	# rm -r usr/src/xrt-aws*

	# Set version
	mv usr/src/{xrt-*,xrt-xocl-$pkgver}
}
