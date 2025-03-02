# Maintainer: Gökçe Aydos <aur2024@aydos.de>
_name=xrt
pkgbase=$_name-git
pkgver=r7478.39bc63b935
pkgrel=1
pkgdesc="Xilinx runtime for Ultrascale, Versal and MPSoC-based FPGAs"
arch=(x86_64)
url='https://xilinx.github.io/XRT/master/html'
license=(Apache)
depends=(
# Based on src/runtime_src/tools/scripts/xrtdeps.sh
	lsb-release  # Used in tests
	boost
	libtiff
	#cppcheck #TODO report upstream: not-needed since https://github.com/Xilinx/XRT/commit/0bd3e8c83840f341f028588a26cb9151fdd04542
	#curl #TODO report upstream: not required

	dkms
	# `dkms` optdepends on all `linux-*headers`.
	# According to https://wiki.archlinux.org/title/DKMS_package_guidelines#Dependencies
	# `linux-*headers` should not be listed as a dependency.

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

	xilinx-u280-gen3x16-xdma-base
	# for `create_xsabin.sh` in post_install, otherwise platform file empty.
	# Actually an optdepends, because XRT supports also other cards.
)
makedepends=(
	cmake
	git
)
provides=($_name)
conflicts=($_name)
options=(!debug)

# For U280 support use:
	#$_name::git+https://github.com/xilinx/XRT#commit=39bc63b
	#xocl-driver-fixes-for-current-kernels.patch::https://github.com/Xilinx/XRT/pull/8005.patch
source=(
	$_name::git+https://github.com/xilinx/XRT
	#xocl-driver-fixes-for-current-kernels.patch::https://github.com/Xilinx/XRT/pull/8005.patch
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
	SKIP
)
pkgver() {
	cd $_name
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    # For U280 support uncomment:
	#echo Patch xocl
	#git -C xrt \
	#	apply $srcdir/xocl-driver-fixes-for-current-kernels.patch

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
		submodule update
	mkdir microblaze-fw
	tar xf data.tar.gz -C microblaze-fw ./lib/firmware/xilinx
}
build() {
	cd $_name
	mkdir -p clean-build && cd clean-build
	local cmake_flags+=" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/xilinx -DXRT_INSTALL_PREFIX=/opt/xilinx -DXRT_DKMS_ALVEO=ON"
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

pkgname=($pkgbase xrt-xocl-dkms-git)
package_xrt-git() {
	depends+=(xrt-xocl-dkms-git)
    install=xsabin.install
	DESTDIR=$pkgdir make -C $_name/clean-build install
	# Move /lib to /usr/lib, otherwise: `failed to commit transaction (conflicting files)`
	mv "$pkgdir"/lib "$pkgdir"/usr

	# Drivers belong to the DKMS package, move them to a temporary dir.
	mv $pkgdir/usr/src $pkgdir/..

	# Moving systemd services
	#local dest=$pkgdir/usr/lib/systemd/system
	#mkdir -p $dest
	#mv $pkgdir/opt/xilinx/xrt/etc/*service $dest

	# Moving binaries
	#local dest=$pkgdir/usr/bin
	#mkdir -p $dest
	#mv $pkgdir/usr/local/bin/* $dest
	#rm -r $pkgdir/usr/local/bin

	# Moving appdebug
	#mv $pkgdir/opt/xilinx/xrt/share/appdebug $pkgdir/usr/local/xrt/python
	#rmdir $pkgdir/opt/xilinx{/xrt/share,/xrt,}

    # The following lines are adapted from postinst of control.tar.gz of the debian package
	ln -s 283bab8f654d8674968f4da57f7fa5d7 "$pkgdir"/usr/lib/firmware/xilinx/fb2b2c5a19ed63593fea95f51fbc8eb9
    mkdir -p "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/firmware
	ln -s /lib/firmware/xilinx/283bab8f654d8674968f4da57f7fa5d7/partition_metadata.json "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/partition_metadata.json
	ln -s /lib/firmware/xilinx/283bab8f654d8674968f4da57f7fa5d7/partition.xsabin "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/partition.xsabin
    ## I changed  /opt/xilinx/xrt/share/fw to /lib/firmware/xilinx/ because XRTFW_FILES is somehow not defined in:
    # https://github.com/Xilinx/XRT/blob/50f17b1d5a29b7af9a9abbc88815883958efdb35/src/runtime_src/ert/CMakeLists.txt#L29
	ln -s /lib/firmware/xilinx "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/firmware/ert-v30
	ln -s /opt/xilinx/firmware/cmc/u280 "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/firmware/cmc-u280
	ln -s /opt/xilinx/firmware/sc-fw/u280 "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/firmware/sc-fw-u280
}
package_xrt-xocl-dkms-git() {
	pkgdesc="Drivers for Xilinx runtime (XRT)"
	provides=(xrt-xocl-dkms)
    conflicts=(xrt-xocl-dkms)

	# Collect drivers
	local dest=$pkgdir/usr
	mkdir $dest
	cp -r $pkgdir/../src $dest

	cd $pkgdir
	# AWS drivers not required
	rm -r usr/src/xrt-aws*

	# Set version
	mv usr/src/{xrt-*,xrt-xocl-$pkgver}
}
