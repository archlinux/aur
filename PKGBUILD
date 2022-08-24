# Maintainer: Gökçe Aydos <aur2022@aydos.de>
_name=xrt
pkgbase=$_name-git
pkgver=r6636.c0e57b76f
pkgrel=1
pkgdesc="Xilinx runtime for Ultrascale, Versal and MPSoC-based FPGAs"
arch=(x86_64)
url='https://xilinx.github.io/XRT/master/html/'
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
source=(
	$_name::git+https://github.com/xilinx/XRT
	git+https://github.com/Xilinx/dma_ip_drivers
	xrt-fixes-for-current-kernels-and-gcc.patch::https://github.com/Xilinx/XRT/pull/6908.patch
	dma-ip-drivers-fixes-for-current-kernels.patch::https://github.com/Xilinx/dma_ip_drivers/pull/176.patch
)
sha256sums=(
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
	echo Patch $_name
	git -C $_name am $srcdir/xrt-fixes-for-current-kernels-and-gcc.patch

	echo Patch $_name/src/runtime_src/core/pcie/driver/linux/xocl/lib/libqdma
	git -C dma_ip_drivers \
		am $srcdir/dma-ip-drivers-fixes-for-current-kernels.patch

	# Submodule integration based on
	# https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
	git -C $_name config \
		submodule.src/runtime_src/core/pcie/driver/linux/xocl/lib/libqdma.url \
		../dma_ip_drivers
	git -C $_name submodule update
}
build() {
	cd $_name

	# Remove -D_GLIBCXX_ASSERTIONS as a workaround for
	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105545
	# (`__builtin_memcpy... may overlap up to` error)
	#TODO remove after resolution
	CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
	mkdir -p clean-build && cd clean-build
	local cmake_flags+=" -DCMAKE_BUILD_TYPE=Release"
	cmake $make_flags ../src
	make
}

check() {
	# Tests require the package to be installed in the build directory. 
	DESTDIR=$srcdir/$_name/clean-build \
		make -C $_name/clean-build install

	cd $srcdir/$_name/clean-build
	ctest --output-on-failure
}

pkgname=($pkgbase xrt-xocl-dkms-git)
package_xrt-git() {
	depends+=(xrt-xocl-dkms-git)
	echo ${depends[@]}
	DESTDIR=$pkgdir make -C $_name/clean-build install

	# Drivers belong to the DKMS package, move them to a temporary dir.
	mv $pkgdir/usr/src $pkgdir/..

	# Systemd services
	local dest=$pkgdir/usr/lib/systemd
	mkdir -p $dest
	mv $pkgdir/opt/xilinx/xrt/etc $dest/system

	# Fix /usr/local
	mv $pkgdir/usr/{local,bin}
}
package_xrt-xocl-dkms-git() {
	pkgdesc="Drivers for Xilinx runtime (XRT)"

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
