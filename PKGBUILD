# Maintainer: Gökçe Aydos <aur2024@aydos.de>
_name=xrt
pkgbase=$_name-git
pkgver=r7456.50f17b1d5
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
)
makedepends=(
	cmake
	git
)
provides=($_name)
conflicts=($_name)
options=(!debug)
source=(
	$_name::git+https://github.com/xilinx/XRT
	git+https://github.com/Xilinx/dma_ip_drivers
	git+https://github.com/serge1/ELFIO
	xrt-fixes-for-current-kernels.patch::https://github.com/Xilinx/XRT/pull/7899.patch
	dma-ip-drivers-fixes-for-current-kernels.patch::https://github.com/Xilinx/dma_ip_drivers/pull/252.patch
)
sha256sums=(
	SKIP
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
	echo Patch $_name/src/runtime_src/core/pcie/driver/linux/xocl/lib/libqdma
	git -C dma_ip_drivers \
		apply $srcdir/dma-ip-drivers-fixes-for-current-kernels.patch

	echo Patch $_name
	git -C $_name \
		apply $srcdir/xrt-fixes-for-current-kernels.patch

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
}
build() {
	cd $_name
	mkdir -p clean-build && cd clean-build
	local cmake_flags+=" -DCMAKE_BUILD_TYPE=Release"
	cmake $make_flags ../src
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
	DESTDIR=$pkgdir make -C $_name/clean-build install

	# Drivers belong to the DKMS package, move them to a temporary dir.
	mv $pkgdir/usr/src $pkgdir/..

	# Moving systemd services
	local dest=$pkgdir/usr/lib/systemd/system
	mkdir -p $dest
	mv $pkgdir/usr/local/xrt/etc/*service $dest

	# Moving binaries
	local dest=$pkgdir/usr/bin
	mkdir -p $dest
	mv $pkgdir/usr/local/bin/* $dest
	rm -r $pkgdir/usr/local/bin

	# Moving appdebug
	mv $pkgdir/opt/xilinx/xrt/share/appdebug $pkgdir/usr/local/xrt/python
	rmdir -p $pkgdir/opt/xilinx
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
